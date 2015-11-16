#include <iostream>
#include <cmath>

#include <wignerSymbols.h>

extern "C"
{
    void __rec3jj_module_MOD_rec3jj(double * thrcof, double * l2, double* l3, double* m2,
        double* m3, double* l1min, double* l1max, int* ndim, int* ier);
}

void rec3jj(double * thrcof, double l2, double l3, double  m2, double m3,
    double l1min, double l1max, int ndim, int ier)
{
    __rec3jj_module_MOD_rec3jj(thrcof,&l2,&l3,&m2,&m3,&l1min,&l1max,&ndim,&ier);
}

void tes_wigner_symbols()
{
    std::cout<<"\n tes_wigner_symbols \n"<<std::endl;
    double test11 = WignerSymbols::wigner3j(325, 999, 1221, 280, 899, -1179);
    std::cout <<"wigner3j(325, 999, 1221, 280, 899, -1179) = "<< test11 << std::endl;
    std::cout<<"\n"<<std::endl;
}

void test_rec3jj()
{
    std::cout<<"\n test_rec3jj \n"<<std::endl;
    double l2 = 999;
    double l3 = 1221;
    double m2 = 899;
    double m3 = -1179;
    double l1 = 325;
    double m1 = -(m2+m3);
    std::cout<<"m1 = "<<m1<<std::endl;
    double l1min = std::max(std::abs(l2-l3),std::abs(m1));
    std::cout<<"l1min = "<<l1min<<std::endl;
    double l1max = l2 + l3;
    std::cout<<"l1max = "<<l1max<<std::endl;
    const int ndim = l1max - l1min + 1;
    std::cout<<"ndim = "<<ndim<<std::endl;
    std::cout<<"\n"<<std::endl;
    double* thrcof = new double[ndim];
    int ier=0;
    rec3jj(thrcof,l2,l3,m2,m3,l1min,l1max,ndim,ier);
    std::cout<<"ier = "<<ier<<std::endl;
    std::cout<<"wigner3j(325, 999, 1221, 280, 899, -1179) = "<<thrcof[size_t(l1-l1min)]<<std::endl;
    delete[] thrcof;
}

int main()
{
    tes_wigner_symbols();
    test_rec3jj();
    return 0;
}
