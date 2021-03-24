#!make

BASE_SERVICE := audit-node-modules-with-yara
BASE_COMPOSE := docker-compose -f docker-compose.yml

# Folders
WORK_DIR :=/opt/anwy
DOCKER_FOLDER := docker
FOLDER_TO_AUDIT := folder_to_audit
ARTIFACT_FOLDER := artifacts
YARA_RULE_FOLDER := yara_rules
EXECUTOR_FOLDER := executor

# Log operation message
define log_operation
	@echo '[OPERATION] $(1)'
endef

# Log error message
define log_error
	@echo '[ERROR] $(1)'
endef

# Common function to execute docker container
define execute_docker
	$(call log_operation, 'Building container ${BASE_SERVICE}')

	@ cd $(DOCKER_FOLDER) && docker-compose build \
		--build-arg WORK_DIR=$(WORK_DIR) \
		--build-arg FOLDER_TO_AUDIT=$(FOLDER_TO_AUDIT) \
		--build-arg ARTIFACT_FOLDER=$(ARTIFACT_FOLDER) \
		--build-arg YARA_RULE_FOLDER=$(YARA_RULE_FOLDER) \
		--build-arg EXECUTOR_FOLDER=$(EXECUTOR_FOLDER) > /dev/null
	@ cd $(DOCKER_FOLDER) && $(BASE_COMPOSE) up -d
	@ cd $(DOCKER_FOLDER) && $(BASE_COMPOSE) exec $(BASE_SERVICE) bash -c $(1) || true
	@ cd $(DOCKER_FOLDER) && $(BASE_COMPOSE) stop
	@ cd $(DOCKER_FOLDER) && $(BASE_COMPOSE) down
endef

# Run audit operation
run:
ifeq ($(strip ${NODE_MODULE_FOLDER_TO_AUDIT}),)
	$(call log_error, 'NODE_MODULE_FOLDER_TO_AUDIT is not set')
else
	$(call make_workspace)

	$(call log_operation, 'Copying to internal folder. From [$(NODE_MODULE_FOLDER_TO_AUDIT)/*] to [$(FOLDER_TO_AUDIT)]')

	@ cp -rH ${NODE_MODULE_FOLDER_TO_AUDIT}/* ./$(FOLDER_TO_AUDIT)

	$(call log_operation, 'Running audit operation')
	$(call execute_docker, "cd $(WORK_DIR)/$(EXECUTOR_FOLDER) && yarn exeute-audit")

	$(call log_operation, 'Deleting internal folder: [$(FOLDER_TO_AUDIT)]')

	@ rm -rf $(FOLDER_TO_AUDIT)/*
endif

# Connect to the container shell
shell:
	$(call log_operation, 'Executing shell container')

	$(call execute_docker, 'bash')

# Run tests
test:
	$(call log_operation, 'Executing TEST container')

	$(call execute_docker, "cd $(WORK_DIR)/$(EXECUTOR_FOLDER) && yarn test")

.PHONY: run \
shell \
test