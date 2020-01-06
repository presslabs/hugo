PLATFORMS := linux_amd64
include ../../build/makelib/common.mk

IMAGE = $(BUILD_REGISTRY)/hugo-$(ARCH)
CACHE_IMAGES = $(IMAGE)
include ../../build/makelib/image.mk

img.build:
	@$(INFO) docker build $(IMAGE) $(PLATFORM)
	@cp -La . $(IMAGE_TEMP_DIR)
	@mkdir -p $(IMAGE_TEMP_DIR)/rootfs
	@cp $(OUTPUT_DIR)/bin/linux_$(ARCH)/hugo $(IMAGE_TEMP_DIR)/hugo
	@docker build $(BUILD_ARGS) \
		-t $(IMAGE) \
		$(IMAGE_TEMP_DIR)
	@$(OK) docker build $(IMAGE)
