<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru rcec" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rcec="urn:customs.ru:Information:SertifDocuments:ResolutionCommissionExportControl:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
      <xsl:choose>
         <xsl:when test="$month=1">января</xsl:when>
         <xsl:when test="$month=2">февраля</xsl:when>
         <xsl:when test="$month=3">марта</xsl:when>
         <xsl:when test="$month=4">апреля</xsl:when>
         <xsl:when test="$month=5">мая</xsl:when>
         <xsl:when test="$month=6">июня</xsl:when>
         <xsl:when test="$month=7">июля</xsl:when>
         <xsl:when test="$month=8">августа</xsl:when>
         <xsl:when test="$month=9">сентября</xsl:when>
         <xsl:when test="$month=10">октября</xsl:when>
         <xsl:when test="$month=11">ноября</xsl:when>
         <xsl:when test="$month=12">декабря</xsl:when>
      </xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
   <xsl:template name="Date_2">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rcec:ResolutionCommissionExportControl">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
                    div.page {
                        width: 210mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    </style>
         <table width="600mm">
            <tr>
               <td align="center" class="graph12">КОМИССИЯ ПО ЭКСПОРТНОМУ КОНТРОЛЮ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
            </tr>
            <tr>
               <td align="center" class="graph12">РАЗРЕШЕНИЕ № 
				<xsl:value-of select="rcec:RegNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Выдано 
				<xsl:choose>
                     <xsl:when test="rcec:JuridicalPerson">
                        <xsl:value-of select="rcec:JuridicalPerson/cat_ru:OrganizationName"/> 
				<xsl:for-each select="rcec:JuridicalPerson/rcec:Address">
                           <xsl:call-template name="Address"/>
                        </xsl:for-each>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="rcec:IndividualPerson/cat_ru:OrganizationName"/> 
				<xsl:for-each select="rcec:IndividualPerson/cat_ru:Address">
                           <xsl:call-template name="Address"/> 
				</xsl:for-each>
                        <xsl:value-of select="rcec:IdentityCard/cat_ru:IdentityCardName"/>, 
				<xsl:if test="rcec:IdentityCard/cat_ru:IdentityCardSeries">
				серия 
				<xsl:value-of select="."/>, 
				</xsl:if>
				номер 
				<xsl:value-of select="rcec:IdentityCard/cat_ru:IdentityCardNumber"/>, 
				<xsl:for-each select="rcec:IdentityCard/cat_ru:IdentityCardDate">
				выдан 
				<xsl:call-template name="Date_2"/>
                        </xsl:for-each>
                        <xsl:if test="rcec:IdentityCard/cat_ru:OrganizationName">
                           <xsl:value-of select="."/>
                        </xsl:if>
                     </xsl:otherwise>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование и адрес юридического лица, фамилия, имя, отчество физического лица, данные документа, удостоверяющего личность, место жительства)</td>
            </tr>
            <tr>
               <td class="graph10">по заявлению от 
				<xsl:for-each select="rcec:Application/rcec:ApplicationDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each> 
				№ 
				<xsl:value-of select="rcec:Application/rcec:ApplicationNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">на 
				<xsl:variable name="Action" select="rcec:Application/rcec:Action"/>
                  <xsl:choose>
                     <xsl:when test="$Action=1">
				экспорт
				</xsl:when>
                     <xsl:when test="$Action=2">
				временный вывоз
				</xsl:when>
                     <xsl:when test="$Action=3">
				выполнение работ
				</xsl:when>
                     <xsl:when test="$Action=4">
				оказание услуг
				</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:for-each select="rcec:Application/rcec:ProductDescription">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование и характеристика научно-технической продукции, являющейся предметом 
внешнеэкономической операции</td>
            </tr>
            <tr>
               <td class="graph10">в соответствии с 
				<xsl:value-of select="rcec:Application/rcec:ConformityDocument/cat_ru:PrDocumentName"/> 
				<xsl:if test="rcec:Application/rcec:ConformityDocument/cat_ru:PrDocumentNumber">
				№ 
				<xsl:value-of select="rcec:Application/rcec:ConformityDocument/cat_ru:PrDocumentNumber"/> 
				</xsl:if>
                  <xsl:for-each select="rcec:Application/rcec:ConformityDocument/cat_ru:PrDocumentDate">
				от 
				<xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(контракт, номер, дата и т.д.)</td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:value-of select="rcec:Application/rcec:StateDestination"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(государство назначения)</td>
            </tr>
            <tr>
               <td class="graph10">Действительно до 
				<xsl:for-each select="rcec:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(число, месяц, год)</td>
            </tr>
            <tr>
               <td class="graph10">Выдано на основании 
				<xsl:value-of select="rcec:IssueBase/cat_ru:PrDocumentName"/> 
				<xsl:if test="rcec:IssueBase/cat_ru:PrDocumentNumber">
				№ 
				<xsl:value-of select="rcec:IssueBase/cat_ru:PrDocumentNumber"/> 
				</xsl:if>
                  <xsl:for-each select="rcec:IssueBase/cat_ru:PrDocumentDate">
				от 
				<xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(дата и номер заключения государственной экспертизы внешнеэкономической сделки)</td>
            </tr>
            <tr>
               <td class="graph10">Дополнительная информация для целей экспортного контроля 
				<xsl:for-each select="rcec:TermsAction">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(указываются условия действия разрешения)</td>
            </tr>
         </table>
         <table width="600mm">
            <tr>
               <td align="center" class="graph10">
                  <xsl:value-of select="rcec:PersonSignature/cat_ru:PersonPost"/>
               </td>
               <td align="center" class="graph10">____________________________</td>
               <td align="center" class="graph10">
                  <xsl:value-of select="rcec:PersonSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="rcec:PersonSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="rcec:PersonSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(должность)</td>
               <td align="center" class="graph8">(подпись)</td>
               <td align="center" class="graph8">(Ф.И.О.)</td>
            </tr>
            <tr>
               <td align="center" class="graph10" colspan="2">
                  <xsl:for-each select="rcec:PersonSignature/cat_ru:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
               <td align="center" class="graph10">М.П.</td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
