# private function to bind rows keeping common columns
bind_rows2 <- function(l) {
  ll=lengths(l)
  l=l[ll>0]
  if(length(l)==0) return(NULL)
  if(length(l)==1) return(l[[1]])

  nn=lapply(l, names)
  commoncols=Reduce(intersect, nn[-1], init=nn[[1]])
  l=lapply(l, "[", commoncols)

  l <- do.call(function(...) rbind(..., make.row.names=FALSE), l)
  l
}

