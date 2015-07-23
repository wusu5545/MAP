

__global__ void
ScaleImage_Kernel(unsigned char * src,unsigned char * dst, int src_w, int dst_w,
		  int x_ratio,int y_ratio)
{

  size_t i = threadIdx.x;
  size_t j = threadIdx.y;
  
  printf("%d\n",src[src_w]);
  
  if (i == 0 || j == 0){
    dst [j * dst_w + i] = 0;
    return ;
  }
  uint x = ((( i -1) * x_ratio ) >> 16);
  uint y = ((( j -1) * y_ratio ) >> 16);
  dst [j * dst_w + i] = src [y * src_w + x ];
}

__global__ void
setImageForCascadeClassifier(){

}

__global__ void
ScaleImage_Invoker(){

}
