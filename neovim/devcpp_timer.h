#ifndef DEVCPP_TIMER_H
#define DEVCPP_TIMER_H

#include <chrono>
#include <iostream>

class DevCppTimer {
private:
    std::chrono::high_resolution_clock::time_point start;
public:
    DevCppTimer() {
        start = std::chrono::high_resolution_clock::now();
    }

    ~DevCppTimer() {
        auto end = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double> elapsed = end - start;

        std::cout << "\n--------------------------\n";
        std::cout << "Process exited after " << elapsed.count() << " seconds with return value 0\n";
        //std::cout << "Press any key to continue . . .";
        system("pause");
        std::cin.get();
    }
};

// Tạo object toàn cục — chạy trước/sau main()
static DevCppTimer __devcpp_timer__;

#endif // DEVCPP_TIMER_H
