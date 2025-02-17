# Define the compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -Wunused-private-field -std=c++17 -pthread \
		   -L/opt/homebrew/lib -larmadillo -I/opt/homebrew/include \
		   -I/opt/homebrew/include/ -Iinclude -Iinclude/OleanderStemmingLibrary/src \
		   -Wdeprecated-declarations

# Source directories
SRC_DIR = src
OBJ_DIR = obj

# Common source files
COMMON_SOURCES = $(SRC_DIR)/count_vectorization.cpp \
				 $(SRC_DIR)/categories.cpp \
                 $(SRC_DIR)/document.cpp \
                 $(SRC_DIR)/preprocess.cpp \
                 $(SRC_DIR)/file_operations.cpp \
                 $(SRC_DIR)/tfidf.cpp 


# Object files (convert source file paths to object file paths)
COMMON_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(COMMON_SOURCES))			 

# Targets and their specific sources
TARGETS = test1 test2 test3

TEST1_SOURCES = $(SRC_DIR)/main.cpp $(COMMON_SOURCES)
TEST2_SOURCES = $(SRC_DIR)/main_2.cpp $(COMMON_SOURCES)
TEST3_SOURCES = $(SRC_DIR)/main_3.cpp $(COMMON_SOURCES)


TEST1_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(TEST1_SOURCES))
TEST2_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(TEST2_SOURCES))
TEST3_OBJECTS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(TEST3_SOURCES))

# Rules
all: $(TARGETS)

test1: $(TEST1_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

test2: $(TEST2_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

test3: $(TEST3_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(TARGETS) $(OBJ_DIR)

.PHONY: all clean
# 
# # Define the executable name
# TARGET = tfidf
# 
# # Define the source files
# SRCS = src/main_2.cpp src/count_vectorization.cpp src/document.cpp src/preprocess.cpp src/file_operations.cpp src/tfidf.cpp
# 
# # Define the object files
# OBJS = $(SRCS:.cpp=.o)
# 
# # Default target
# all: $(TARGET)
# 
# # Build the executable
# $(TARGET): $(OBJS)
# 	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)
# 
# # Compile each object file
# %.o: %.cpp
# 	$(CXX) $(CXXFLAGS) -c $< -o $@
# 
# # Clean up
# clean:
# 	rm -f $(TARGET) $(OBJS)