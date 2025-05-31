<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/testsuite">
        <html>
        <head>
            <title>JUnit Test Results</title>
            <style>
                body { font-family: Arial, sans-serif; }
                table { border-collapse: collapse; width: 100%; }
                th, td { border: 1px solid #ddd; padding: 8px; }
                th { background-color: #f2f2f2; }
                .passed { background-color: #c8e6c9; }
                .failed { background-color: #ffcdd2; }
                .skipped { background-color: #ffeb3b; }
            </style>
        </head>
        <body>
            <h2>JUnit Test Results for <xsl:value-of select="@name"/></h2>
            <table>
                <tr>
                    <th>Test Case</th>
                    <th>Status</th>
                    <th>Time (s)</th>
                </tr>
                <xsl:for-each select="testcase">
                    <tr>
                        <td><xsl:value-of select="@name"/></td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="failure">Failed</xsl:when>
                                <xsl:when test="error">Error</xsl:when>
                                <xsl:otherwise>Passed</xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td><xsl:value-of select="@time"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
