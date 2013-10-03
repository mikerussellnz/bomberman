LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

SDL_PATH := ../SDL
SDL_image_PATH := ../SDL_image
SDL_mixer_PATH := ../SDL_mixer
SDL_ttf_PATH := ../SDL_ttf
BOOST_PATH := ../boost

LUACPPINTERFACE_PATH := ../luacppinterface/LuaCppInterface
LUA_PATH := ../luacppinterface/lua/src

LOCAL_CFLAGS := -std=c++11 -fexceptions -frtti

LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(SDL_PATH)/include \
	$(LOCAL_PATH)/$(BOOST_PATH) \
	$(LOCAL_PATH)/$(SDL_image_PATH) \
	$(LOCAL_PATH)/$(SDL_mixer_PATH) \
	$(LOCAL_PATH)/$(SDL_ttf_PATH) \
	$(LOCAL_PATH)/$(LUACPPINTERFACE_PATH) \
	$(LOCAL_PATH)/$(LUA_PATH)

# Add your application source files here...
LOCAL_SRC_FILES := $(SDL_PATH)/src/main/android/SDL_android_main.cpp \
	main.cpp \
	gamescene.cpp \
	inputstate.cpp \
	printlog.cpp \
	map.cpp \
	entity.cpp \
	block.cpp \
	floortile.cpp \
	player.cpp \
	computer.cpp \
	bomb.cpp \
	explosion.cpp \
	utils.cpp \
	softblock.cpp \
	corpse.cpp \
	propbomb.cpp \
	propexplosion.cpp \
	fadescene.cpp \
	menuscene.cpp \
	setupscene.cpp \
	scriptapi.cpp \
	victoryscene.cpp
	

LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer SDL2_ttf
LOCAL_STATIC_LIBRARIES := luacppinterface lua

LOCAL_LDLIBS := -lGLESv1_CM -llog

include $(BUILD_SHARED_LIBRARY)
