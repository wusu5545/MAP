

__global__ void
ScaleImage_Kernel(unsigned char * src,unsigned char * dst, int src_w, int dst_w,
		  int x_ratio,int y_ratio)
{

  size_t i = threadIdx.x;
  size_t j = blockIdx.x;
  
//   printf("%d,%d\n",i,j);
  
  if (i == 0 || j == 0){
    dst[j * dst_w + i] = 0;
    return ;
  }
  uint x = ((( i -1) * x_ratio ) >> 16);
  uint y = ((( j -1) * y_ratio ) >> 16);
  dst[j * dst_w + i] = src[y * src_w + x ];
  
//   printf("%d\n",dst[dst_w-1]);
}

__global__ void
IntergralImages_row_Kernel(unsigned char * src,int * sum,int * sqsum,
					      int height,int width)
{
  size_t i = threadIdx.x;
  
  unsigned char temp;
  
  for (size_t j = 1;j<height;j++)
  {
     temp=src[j*width+i];
     sum[j*width+i] = sum[(j-1)*width+i]+temp;
     sqsum[j*width+i] = sqsum[(j-1)*width+i]+temp*temp;
  }
//   printf("%d\n",i);
}

__global__ void
IntergralImages_col_Kernel(int * sum,int * sqsum,int width)
{
  size_t j = threadIdx.x;
  
  for (size_t i = 1;i<width;i++)
  {
    sum[j*width+i] += sum[j*width+i-1];
    sqsum[j*width+i] += sqsum[j*width+i-1];
  }
  
//   printf("%d\n",sum[2*width-1]);
  
}

__global__ void
ScaleImage_Invoker(){

}
