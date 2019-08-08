<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru acex" version="1.0" xmlns:acex="urn:customs.ru:Information:CustomsDocuments:ActExpertise:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="acex:ActExpertise">
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
                        
                        table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; }
                    table.items th {background-color: WhiteSmoke;}
                    }
                    </style>
         <table style="width:170mm">
            <tr>
               <td align="right" class="graph12">"Утверждаю"</td>
            </tr>
            <tr>
               <td align="right" class="graph10">
                  <br>Начальник государственной инспекции</br>
                  <br>пробирного надзора</br>
                  <br>
                     <xsl:value-of select="acex:ChiefInspection/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="acex:ChiefInspection/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="acex:ChiefInspection/cat_ru:PersonMiddleName"/>
                  </br>
               </td>
            </tr>
            <tr>
               <td align="right" class="graph10">
                  <xsl:for-each select="acex:ChiefInspection/cat_ru:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph12">Акт экспертизы</td>
            </tr>
            <tr>
               <td class="graph10">Комиссия  
				<xsl:value-of select="acex:NameCommission"/> 
				государственной инспекции пробирного надзора
в составе 
<table>
                     <xsl:for-each select="acex:ListCommission">
                        <tr>
                           <td class="graph10">
                              <xsl:value-of select="cat_ru:PersonPost"/>
                           </td>
                           <td class="graph10">
                              <xsl:value-of select="cat_ru:PersonSurname"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:PersonName"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="cat_ru:PersonMiddleName"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </td>
            </tr>
            <tr>
               <td class="graph10">на основании постановления (определения) 
				<xsl:value-of select="acex:Authority"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(наименование органа, назначившего экспертизу)</td>
            </tr>
            <tr>
               <td class="graph10">N 
				<xsl:value-of select="acex:Resolution/acex:DocumentNumber"/> 
				от 
				<xsl:for-each select="acex:Resolution/acex:DocumentDate">
                     <xsl:call-template name="Date"/> 
				</xsl:for-each>
				  произвела экспертизу</td>
            </tr>
            <tr>
               <td class="graph10">предъявленных изделий (материалов) по квитанции N 
				<xsl:value-of select="acex:Receipt/acex:DocumentNumber"/>
				 от 
				<xsl:for-each select="acex:Receipt/acex:DocumentDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">На экспертизу были представлены:  
				</td>
            </tr>
            <xsl:for-each select="acex:Production">
               <tr>
                  <td class="graph10">
                     <xsl:number count="acex:Production" format="1."/> 
				<xsl:value-of select="."/> 
				</td>
               </tr>
            </xsl:for-each>
            <tr>
               <td class="graph10">На разрешение экспертизы поставлены вопросы:</td>
            </tr>
            <xsl:for-each select="acex:Questions">
               <tr>
                  <td class="graph10">
                     <xsl:number count="acex:Questions" format="1."/> 
				<xsl:value-of select="."/> 
				</td>
               </tr>
            </xsl:for-each>
            <tr>
               <td align="center" class="graph10">Экспертизой установлено:</td>
            </tr>
         </table>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center" class="graph10" style="width:10mm">N п/п</td>
               <td align="center" class="graph10" style="width:60mm">наименование изделий (материалов)</td>
               <td align="center" class="graph10" style="width:20mm">количество, шт.</td>
               <td align="center" class="graph10" style="width:20mm">масса, г</td>
               <td align="center" class="graph10" style="width:40mm">наименование драгоценного металла (недрагметалл)</td>
               <td align="center" class="graph10" style="width:20mm">проба</td>
            </tr>
            <xsl:for-each select="acex:ResultsExamination">
               <tr>
                  <td class="graph10">
                     <xsl:number count="acex:ResultsExamination" format="1"/>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="acex:NameProduction">
                        <xsl:value-of select="."/> 
				</xsl:for-each>
                  </td>
                  <td class="graph10">
                     <xsl:value-of select="acex:Quantity"/>
                  </td>
                  <td class="graph10">
                     <xsl:value-of select="acex:WeighQuantity"/>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="acex:NameMetal">
                        <xsl:value-of select="."/> 
				</xsl:for-each>
                  </td>
                  <td class="graph10">
                     <xsl:for-each select="acex:Sample">
                        <xsl:value-of select="."/> 
				</xsl:for-each>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
         <table cellpadding="3" cellspacing="3" style="width:170mm">
            <tr>
               <td class="graph10" colspan="4">Экспертиза проведена посредством (методом) 
				<xsl:value-of select="acex:MethodExpertise"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Права и обязанности, предусмотренные ст. 
				<xsl:value-of select="acex:Article"/> 
				УПК РФ комиссии разъяснены.</td>
            </tr>
            <td class="graph10">Комиссия</td>
            <xsl:for-each select="acex:CommissionSignature">
               <tr>
                  <td class="graph10"/>
                  <td class="graph10">
                     <xsl:value-of select="cat_ru:PersonPost"/>
                  </td>
                  <td class="graph10">______________________</td>
                  <td class="graph10">
                     <xsl:value-of select="cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="cat_ru:PersonMiddleName"/>
                  </td>
               </tr>
            </xsl:for-each>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
