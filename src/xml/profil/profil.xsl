<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : profil.xsl
    Created on : October 6, 2020, 3:47 PM
    Author     : arthur
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:tux="http://myGame/tux">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Profil</title>
            </head>
            
            <body>
                <h1>Profil</h1>

                <xsl:value-of select="tux:profil/tux:nom"/> <br/>
                <xsl:value-of select="tux:profil/tux:avatar"/> <br/>
                <xsl:value-of select="tux:profil/tux:anniversaire"/> <br/>

                <table>
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Pourcentage trouvé</th>
                            <th>Temps</th>
                            <th>Mot</th>
                            <th>Niveau</th>
                        </tr>
                    </thead>
                    
                    <xsl:for-each select="tux:profil/tux:parties/tux:partie">
                        <xsl:sort select="@date"/>

                        <tbody>
                            <tr>
                                <th>
                                    <xsl:value-of select="@date"/>
                                </th>
                                <th>
                                    <xsl:value-of select="@trouvé"/>
                                </th>
                                <th>
                                    <xsl:value-of select="tux:temps"/>
                                </th>
                                <th>
                                    <xsl:value-of select="tux:mot"/>
                                </th>
                                <th>
                                    <xsl:value-of select="tux:mot/@niveau"/>
                                </th>
                            </tr>
                        </tbody>
                        
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
