if [ ! -d "cpp" ]; then
	mkdir cpp
fi
./protoc --cpp_out=cpp *.proto