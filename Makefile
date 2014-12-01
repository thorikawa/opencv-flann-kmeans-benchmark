OpenCV_DIR?=/usr/local/opencv-3.0.0-beta
CXX?=g++
CXXFLAGS=-I$(OpenCV_DIR)/include -O3 -Wall
LDFLAGS=-L${OpenCV_DIR}/lib -L/usr/local/lib \
-lopencv_core -lopencv_highgui -lopencv_features2d -lopencv_imgproc \
-lopencv_calib3d -lopencv_imgcodecs -lopencv_xfeatures2d \
-lpthread
BUILD_DIR=bin
#SRCS= match.cpp Utils.cpp BoostDesc.cpp
SRCS=main.cpp
OBJS=${SRCS:%.cpp=${BUILD_DIR}/%.o}

main: $(OBJS)
	${CXX} ${LDFLAGS} ${OBJS} -o $@
${BUILD_DIR}/%.o : %.cpp
	@mkdir -p $(dir $@)
	${CXX} ${CXXFLAGS} -c $< -o $@
clean:
	rm -rf ${BUILD_DIR} main
