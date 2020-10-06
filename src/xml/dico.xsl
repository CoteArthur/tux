<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : dico.xsl
    Created on : October 6, 2020, 3:27 PM
    Author     : arthur
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:tux="http://myGame/tux">
    <xsl:output method="html"/>

    <xsl:key name="mot-by-niveau" match="tux:mot" use="@niveau"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Dictionnaire</title>
            </head>
            
            <body>
                <h1>Dictionnaire</h1>
                <table>
                    <xsl:for-each select="tux:dictionnaire/tux:mot[count(. | key('mot-by-niveau', @niveau)[1]) = 1]">

                        <xsl:sort select="@niveau" />
                        <thead>
                            <tr>
                                <th>
                                    <xsl:value-of select="@niveau" />
                                </th>
                            </tr>
                        </thead>

                        <tbody>
                                <xsl:for-each select="key('mot-by-niveau', @niveau)">
                                    <xsl:sort select="." />
                                    <tr>
                                        <th>
                                            <xsl:value-of select="." />
                                        </th>
                                    </tr>
                                </xsl:for-each>
                        </tbody>
                        
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
