int fac(int i) {
   if (i = 0)
      return 1;
   else
      return i * fac(i-1);
}

int main() {
   return fac(5);
}