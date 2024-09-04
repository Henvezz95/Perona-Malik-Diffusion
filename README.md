# Perona-Malik-Diffusion
Perona–Malik diffusion, also called anisotropic diffusion, is a technique aimed at reducing image noise presented by [Perona and Malik in 1987](https://authors.library.caltech.edu/6498/1/PERieeetpami90.pdf).
The main idea is to blur the uniform areas of the images to wash out noise while keeping the strong edges of the image intact. 
It is based on the equation of heat diffusion in a non-uniform medium. Different brightness levels are treated as different temperatures and edges are considered as materials with a low heat diffusion coefficient(thermal insulating material). The equation that describes the Perona-Malik diffusion is the following:


![Anisotropic Diffusion Formula](_img1.jpg)




where I is the intensity function representing the brightness levels of the image and c is a function that is equal to 1 when the gradient norm is zero and goes to 1 when the gradient norm tends to infinity.

The folder contains both an explicit solution and a semi-implicit solution to the differential equation in MATLAB. It can be used to remove noise from both gray-scale and RGB images. 

# Implementations
The repository contains two implementations of the algorithm:
- Explicit Method: solves the equation in its explicit form using finite differences. It is easier to understand but to be mathematically stable, the time step dt must be less than 0.25. For this reason, more iterations are required, making the process slower
- Semi-Implicit Method with AOS: solves the equation in its implicit form. It uses Additive Operator Splitting to reduce the system to the solution of a tridiagonal matrix, that can be processed in a short time using Thomas' algorithm. The Semi-Implicit Method is mathematically stable and allows for much bigger values of dt. In this way, the algorithm requires a small number of steps (max 5-10) and is thus faster than the explicit method.

This repository takes inspiration from this [paper](https://www.researchgate.net/publication/221128740_Parallel_Implementations_of_AOS_Schemes_A_Fast_Way_of_Nonlinear_Diffusion_Filtering) and a set of slides with more details on the final implementation can be found [here](https://www.dm.unibo.it/~morigi/homepage_file/courses_file/file_dl/nonlineari_s.pdf). 

# Results
The advantage of the Perona-Malik diffusion is that it removes noise by blurring the smooth areas of the image while preserving the edges.

