% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pluginFramework.R
\name{registerPlugins}
\alias{registerGatingFunction}
\alias{registerPlugins}
\title{Register a gating or preprocessing function with OpenCyto}
\usage{
registerPlugins(fun = NA, methodName, dep = NA, ...)
}
\arguments{
\item{fun}{\code{function} to be registered}

\item{methodName}{\code{character} name of the gating or preprocessing method}

\item{dep}{\code{character} name of the library dependency required for the plugin method to work.}

\item{...}{other arguments
type \code{character} specifying the type of registering method. Should be either "gating" or "preprocessing".}
}
\value{
\code{logical} TRUE if successful and prints a message. FALSE otherwise.
}
\description{
Function registers a new gating or preprocessing method with openCyto so that it may be used in the 
csv template.
}
\details{
The \code{fun} argument should be a wrapper function definition for the gating or preprocessing method. 
                         Gating method must have formal arguments:

                          fr a \code{flowFrame}

                          pp_res a pre-processing result

                          xChannel \code{character} (optional)

                          yChannel \code{character} (required)

                          filterId \code{character}

                          ... ellipses for the additional parameters.

                         Preprocessing method must have formal arguments:

                         fs a \code{flowSet} that stores the flow data (could be subgrouped data if \code{groupBy} column is defined in the csv template

                         gs a \code{GatingSet}
 
                         gm a \code{gtMethod} object that stores the information from gating method

                         xChannel \code{character} (required)

                         yChannel \code{character} (required)

                          ... ellipses for the additional parameters.

The gating function must return a filter (i.e. polygonGate or other instance) from flowCore.
The preprocessing can return anything and it will be passed on to the gating function. So it is up to gating function to use and interpret the results of preprocessing.
Not all formal parameters need to be used. Additional arguments are passed via the ... and can be processed in the wrapper
}

