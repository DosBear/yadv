<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:adlst="urn:customs.ru:Information:EArchDocuments:ArchDocumentList:5.13.1" xmlns:ct="urn:customs.ru:Information:EArchDocuments:EADCommonTypes:5.13.1">
    <xsl:output version="1.0" encoding="UTF-8" indent="no" omit-xml-declaration="no" media-type="text/html" />
    <xsl:template match="adlst:ArchDocumentList">
        <html>
            <head>
                <title />
                <style type="text/css">
					table, td{
						border-collapse: collapse;
						border: 1px solid black;
					}
                </style>
            </head>
            <body>
                <b><center>Список документов</center></b>
                <br />
                    <table border="1" width="100%">
                        <thead>
                            <tr valign="top" style="font-size:x-small">
                                <td align="center" width="171">Наименование</td>
                                <td align="center">Номер</td>
                                <td align="center" width="183">Дата документа</td>
                                <td align="center">Уникальный номер в ЭАД</td>
                                <td align="center">Уникальный номер в АРМе декларанта</td>
                                <td align="center">Статус</td>
                                <td align="center">Код документа по альбому форматов</td>
                                <td align="center">Код вида представляемого документа</td>
                                <td align="center">Дата начала действия</td>
                                <td align="center">Дата окончания действия</td>
                                <td align="center">Дата помещения в ЭАД</td>
                                <td align="center">Номер первой ДТ, при подаче которой был использован документ</td>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="adlst:DocumentInfo">
                                <tr style="font-size:x-small; ">
                                    <td width="171">
                                        <xsl:for-each select="ct:PrDocumentName">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="ct:PrDocumentNumber">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td width="183">
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="ct:PrDocumentDate"/></xsl:call-template>
                                    </td>
                                    <td>
                                        <xsl:for-each select="adlst:ArchDocID">
											<xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="adlst:ArchDocumentID">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="adlst:ArchDocStatus">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="adlst:DocumentCode">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:for-each select="adlst:PresentedDocumentModeCode">
                                            <xsl:apply-templates />
                                        </xsl:for-each>
                                    </td>

                                    <td>
                                        <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adlst:DocBeginDate"/></xsl:call-template>
                                    </td>
                                    <td>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adlst:DocEndDate"/></xsl:call-template>
                                    </td>
                                    <td>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="adlst:ArchDocDate"/></xsl:call-template>
                                    </td>
                                    <td>
										<xsl:for-each select="adlst:FirstDT">
                                            <xsl:value-of select="ct:CustomsCode"/>
                                            <xsl:text>/</xsl:text>
                                            <xsl:call-template name="gtd_date"><xsl:with-param name="dateIn" select="ct:RegistrationDate"/></xsl:call-template>
                                            <xsl:text>/</xsl:text>
                                            <xsl:value-of select="ct:GTDNumber"/>
                                        </xsl:for-each>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    <br />
                    <table width="100%">
                        <tbody>
                            <tr>
                                <td align="right">
                                    <span style="font-size:xx-small; ">Содержимое архива с идентификатором </span>
                                    <xsl:for-each select="ct:ArchID">
                                        <span style="font-size:xx-small; ">
                                            <xsl:apply-templates />
                                        </span>
                                    </xsl:for-each>
                                    <br />
                                    <span style="font-size:xx-small; ">Для декларанта </span>
                                    <xsl:for-each select="ct:ArchDeclID">
                                        <span style="font-size:xx-small; ">
                                            <xsl:apply-templates />
                                        </span>
                                    </xsl:for-each>
                                    <br />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                <br />
            </body>
        </html>
    </xsl:template>
<xsl:template name="gtd_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template><xsl:template name="russian_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
