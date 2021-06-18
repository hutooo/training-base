#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define N 10000

void prime1() {
    int32_t a[N+1];
    // 将从2开始的所有的元素置为1
    for (int i = 2; i <= N; i++) {
        a[i] = 1;
    }
    // 厄拉多塞筛法
    for (int i = 2; i <= N; i++) {
        if (a[i] != 0) {
            for (int j = i; j <= N/i; j++) {
                a[i*j] = 0;
            }
        }
    }

    for (int i = 2; i <= N; i++) {
        if (a[i] != 0) {
            printf("%4d ", i);
        }
    }

    printf("\n");
}

void prime2() {
    int32_t a[N+1] = {[0]=0,[1]=0};
    // 将从2开始的所有的元素置为1
    for (int i = 2; i <= N; i++) {
        a[i] = 1;
    }
    int32_t sq = sqrt(N+1);
    // 厄拉多塞筛法
    for (int i = 2; i <= sq; i++) {
        if (a[i] != 0) {
            for (int j = i * i; j <= N; j+=i) {
                a[j] = 0;
            }
        }
    }

    uint32_t count = 0;
    for (int i = 2; i <= N; i++) {
        if (a[i] != 0) {
            printf("%4d ", i);
            count += 1;
        }
    }

    printf("\n");
    printf("total prime count is %d\n", count);
}

int main(void) {
    prime1();
    prime2();
}