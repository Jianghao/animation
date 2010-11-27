\name{cv.nfeaturesLDA}
\alias{cv.nfeaturesLDA}
\title{ Cross-validation to find the optimum number of features (variables) in LDA }
\description{
This function has provided an illustration of the process of finding out the optimum number of variables using k-fold cross-validation in a linear discriminant analysis (LDA).
}
\usage{
cv.nfeaturesLDA(data = matrix(rnorm(600), 60), cl = gl(3, 20),
    k = 5, cex.rg = c(0.5, 3), col.av = c("blue", "red"))
}
\arguments{
  \item{data}{ a data matrix containg the predictors in columns }
  \item{cl}{ a factor indicating the classification of the rows of \code{data} }
  \item{k}{ the number of folds }
  \item{cex.rg}{ the range of the magnification to be used to the points in the plot }
  \item{col.av}{ the two colors used to respectively denote rates of correct predictions in the i-th fold and the average rates for all k folds }
}
\details{
  For a classification problem, usually we wish to use as less variables as possible because of difficulties brought by the high dimension. 
  
  The selection procedure is like this:

\itemize{
\item Split the whole data randomly into \eqn{k} folds:
\itemize{
\item For the number of features \eqn{g = 1, 2, \cdots, g_{max}}{g = 1, 2, ..., gmax}, choose \eqn{g} features that have the largest discriminatory power (measured by the F-statistic in ANOVA):
\itemize{
\item For the fold \eqn{i} (\eqn{i = 1, 2, \cdots, k}{i = 1, 2, ..., k}):
\itemize{
\item Train a LDA model without the \eqn{i}-th fold data, and predict with the \eqn{i}-th fold for a proportion of correct predictions \eqn{p_{gi}}{p[gi]};
}
}
\item Average the \eqn{k} proportions to get the correct rate \eqn{p_g}{p[g]};
}
\item Determine the optimum number of features with the largest \eqn{p}.
}

Note that \eqn{g_{max}} is set by \code{ani.options("nmax")}.
}
\value{
A list containing
  \item{accuracy }{a matrix in which the element in the i-th row and j-th column is the rate of correct predictions based on LDA, i.e. build a LDA model with j variables and predict with data in the i-th fold (the test set) }
  \item{optimum }{the optimum number of features based on the cross-validation}
}
\references{ 
Maindonald J, Braun J (2007). \emph{Data Analysis and Graphics Using R - An Example-Based
Approach}. Cambridge University Press, 2nd edition. pp. 400

\url{http://animation.yihui.name/da:biostat:select_features_via_cv}
}
\author{ Yihui Xie <\url{http://yihui.name}> }
\seealso{ \code{\link{kfcv}}, \code{\link{cv.ani}}, \code{\link[MASS]{lda}} }
\examples{
op = par(pch = 19, mar = c(3, 3, 0.2, 0.7), mgp = c(1.5, 0.5, 0))
cv.nfeaturesLDA()
par(op)

\dontrun{
# save the animation in HTML pages
oopt = ani.options(ani.height = 480, ani.width = 600, interval = 0.5, nmax = 10,
    title = "Cross-validation to find the optimum number of features in LDA",
    description = "This animation has provided an illustration of the process of
    finding out the optimum number of variables using k-fold cross-validation
    in a linear discriminant analysis (LDA).")
ani.start()
par(mar = c(3, 3, 1, 0.5), mgp = c(1.5, 0.5, 0), tcl = -0.3, pch = 19, cex = 1.5)
cv.nfeaturesLDA()
ani.stop()
ani.options(oopt)
}

}
\keyword{ multivariate }
\keyword{ dynamic }
\keyword{ dplot }
\keyword{ classif }