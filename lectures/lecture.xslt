<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" omit-xml-declaration="yes"/>
  <xsl:template match="map/node">
\documentclass[usepdftitle=false,professionalfonts,compress]{beamer}
\usepackage{hyperref}
\usepackage{listings}

\usetheme[]{Warsaw}

\title{<xsl:value-of select="@TEXT"/>}
\author{Kenneth Sundberg}
\subtitle{CS1400}
\date{}

\begin{document}
\frame[plain]{
\frametitle{}
\titlepage
}

\frame{\tableofcontents}
<xsl:for-each select="node">
  \section{<xsl:value-of select="@TEXT"/>}
  <xsl:for-each select="node">
  \subsection{<xsl:value-of select="@TEXT"/>}
  <xsl:for-each select="node">
    <xsl:choose>
      <xsl:when test="@LOCALIZED_STYLE_REF='styles.important'">
\begin{frame}[fragile]
\frametitle{<xsl:value-of select="@TEXT"/>}
\begin{lstlisting}[language=C++]
<xsl:for-each select="node">
<xsl:value-of select="@TEXT"/>
<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
\end{lstlisting}    
\end{frame}
      </xsl:when>
      <xsl:otherwise>
    \begin{frame}
    \frametitle{<xsl:value-of select="@TEXT"/>}
    <xsl:if test="node">
      \begin{itemize}
  <xsl:for-each select="node">
    \item <xsl:value-of select="@TEXT"/>
<xsl:if test="node">
      \begin{itemize}
  <xsl:for-each select="node">
    \item <xsl:value-of select="@TEXT"/>
      <xsl:if test="@LOCALIZED_STYLE_REF='styles.topic'">
        \pause
      </xsl:if>
</xsl:for-each>
      \end{itemize}
    </xsl:if>

      <xsl:if test="@LOCALIZED_STYLE_REF='styles.topic'">
        \pause
      </xsl:if>
</xsl:for-each>
      \end{itemize}
    </xsl:if>
    \end{frame}
  </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
</xsl:for-each>
</xsl:for-each>
    <xsl:text>
\end{document}
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
