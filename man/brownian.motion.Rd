\name{brownian.motion}
\alias{brownian.motion}
\title{Demonstration of Brownian motion on the 2D plane}
\usage{
brownian.motion(n = 10, xlim = c(-20, 20), ylim = c(-20, 20), ...)
}
\arguments{
  \item{n}{Number of points in the scatterplot}

  \item{xlim,ylim}{Arguments passed to
  \code{\link[graphics]{plot.default}} to control the
  apperance of the scatterplot (title, points, etc), see
  \code{\link[graphics]{points}} for details.}

  \item{...}{other arguments passed to
  \code{\link[graphics]{plot.default}}}
}
\value{
  None (invisible \code{NULL}).
}
\description{
  Brownian motion, or random walk, can be regarded as the
  trace of some cumulative normal random numbers.
}
\details{
  The location of the next step is ``current location +
  random Gaussian numbers'', i.e.,

  \deqn{x_{k + 1} = x_{k} + rnorm(1)}{x[k + 1] = x[k] +
  rnorm(1)}

  \deqn{y_{k + 1} = y_{k} + rnorm(1)}{y[k + 1] = y[k] +
  rnorm(1)}

  where \emph{(x, y)} stands for the location of a point.
}
\note{
  The maximum number of steps in the motion is specified in
  \code{ani.options('nmax')}.
}
\examples{
oopt = ani.options(interval = 0.05, nmax = ifelse(interactive(), 150, 2))
brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow", main = "Demonstration of Brownian Motion")
ani.options(oopt)

## create an HTML animation page
saveHTML({
    par(mar = c(3, 3, 1, 0.5), mgp = c(2, 0.5, 0), tcl = -0.3, cex.axis = 0.8, cex.lab = 0.8, 
        cex.main = 1)
    ani.options(interval = 0.05, nmax = ifelse(interactive(), 150, 10))
    brownian.motion(pch = 21, cex = 5, col = "red", bg = "yellow")
}, single.opts = "'controls': ['first', 'previous', 'play', 'next', 'last', 'loop', 'speed'], 'delayMin': 0", 
    title = "Demonstration of Brownian Motion", description = c("Random walk on the 2D plane: for each point", 
        "(x, y), x = x + rnorm(1) and y = y + rnorm(1)."))

ani.options(oopt)

}
\author{
  Yihui Xie <\url{http://yihui.name}>
}
\references{
  \url{http://animation.yihui.name/prob:brownian_motion}
}
\seealso{
  \code{\link[stats]{rnorm}}
}
\keyword{dplot}
\keyword{dynamic}
