<?xml version="1.0" encoding="UTF-8"?>
<!--приказ ФСБ России от 26 сентября 2005 г. N 569 (зарегистрирован Минюстом России 19 октября 2005 г., регистрационный N 7100)
arm:OverloadUnloading = 1 - Приложение 1
arm:OverloadUnloading = 0 - Приложение 2
УТРАТИЛ СИЛУ (приказ ФСБ России от 21 октября 2015 г. N 630)
-->
<xsl:stylesheet exclude-result-prefixes="cat_ru arm" version="1.0" xmlns:arm="urn:customs.ru:Information:CustomsDocuments:ActRegistrationMining:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="Time">
      <xsl:value-of select="substring (., 1, 5)"/>.
	</xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="Action">
      <xsl:variable name="Action" select="arm:Action"/>
      <xsl:choose>
         <xsl:when test="$Action=1">
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления   промышленного рыболовства в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:for-each select="arm:Resolution">
                     <xsl:if test="arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:ResolutionNumber"/> 
	</xsl:if>
                     <xsl:for-each select="arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                     <xsl:if test="arm:Issued">
	выдано 
	<xsl:value-of select="arm:Issued"/>
                     </xsl:if> 
	</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr>
				<td colspan="2">
				   <table class="items" style="width:170mm">
					  <tr>
						 <td align="center" class="graph10">№ п/п</td>
						 <td align="center" class="graph10">Вид продукции</td>
						 <td align="center" class="graph10">Вес (нетто) кг</td>
						 <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
						 <td align="center" class="graph10">Объем использованного сырца, кг</td>
						 <td align="center" class="graph10">Район добычи (зона, подзона)</td>
						 <td align="center" class="graph10">Сроки добычи</td>
					  </tr>
					  <xsl:for-each select="arm:ProductList">
						 <tr>
							<td class="graph10">
							   <xsl:number count="arm:ProductList" format="1."/>
							</td>
							<td class="graph10">
							   <xsl:for-each select="arm:ProductType">
								  <xsl:value-of select="."/> 
		</xsl:for-each>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:Weigh"/>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:ConversionFactor"/>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:Quantity"/>
							</td>
							<td class="graph10">
							   <xsl:for-each select="arm:AreaMining">
								  <xsl:value-of select="."/> 
		</xsl:for-each>
							</td>
							<td class="graph10">
							   <xsl:if test="arm:TimingExtraction">
								  <xsl:value-of select="arm:TimingExtraction"/> 
		<xsl:value-of select="arm:MeasurementUnitTime"/>
							   </xsl:if>
							</td>
						 </tr>
					  </xsl:for-each>
				   </table>
				</td>   
            </tr>
         </xsl:when>
         <xsl:when test="$Action=2">
            <tr>
               <td class="graph10" colspan="2" style="word-break: break-all;">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления прибрежного рыболовства в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:for-each select="arm:Resolution">
                     <xsl:if test="arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:ResolutionNumber"/> 
	</xsl:if>
                     <xsl:for-each select="arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                     <xsl:if test="arm:Issued">
	выдано 
	<xsl:value-of select="arm:Issued"/>
                     </xsl:if> 
	</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr>
				<td colspan="2">
				   <table class="items" style="width:170mm">
					  <tr>
						 <td align="center" class="graph10">№ п/п</td>
						 <td align="center" class="graph10">Вид продукции</td>
						 <td align="center" class="graph10">Вес (нетто) кг</td>
						 <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
						 <td align="center" class="graph10">Объем использованного сырца, кг</td>
						 <td align="center" class="graph10">Район добычи (зона, подзона)</td>
						 <td align="center" class="graph10">Сроки добычи</td>
					  </tr>
					  <xsl:for-each select="arm:ProductList">
						 <tr>
							<td class="graph10">
							   <xsl:number count="arm:ProductList" format="1."/>
							</td>
							<td class="graph10">
							   <xsl:for-each select="arm:ProductType">
								  <xsl:value-of select="."/> 
		</xsl:for-each>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:Weigh"/>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:ConversionFactor"/>
							</td>
							<td class="graph10">
							   <xsl:value-of select="arm:Quantity"/>
							</td>
							<td class="graph10">
							   <xsl:for-each select="arm:AreaMining">
								  <xsl:value-of select="."/> 
		</xsl:for-each>
							</td>
							<td class="graph10">
							   <xsl:if test="arm:TimingExtraction">
								  <xsl:value-of select="arm:TimingExtraction"/> 
		<xsl:value-of select="arm:MeasurementUnitTime"/>
							   </xsl:if>
							</td>
						 </tr>
					  </xsl:for-each>
				   </table>
				</td>   
            </tr>
         </xsl:when>
         <xsl:when test="$Action=3">
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления рыболовства в научно-исследовательских и контрольных целях в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:for-each select="arm:Resolution">
                     <xsl:if test="arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:ResolutionNumber"/> 
	</xsl:if>
                     <xsl:for-each select="arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                     <xsl:if test="arm:Issued">
	выдано 
	<xsl:value-of select="arm:Issued"/>
                     </xsl:if> 
	</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr><td colspan="2">
               <table class="items" style="width:170mm">
                  <tr>
                     <td align="center" class="graph10">№ п/п</td>
                     <td align="center" class="graph10">Вид продукции</td>
                     <td align="center" class="graph10">Вес (нетто) кг</td>
                     <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
                     <td align="center" class="graph10">Объем использованного сырца, кг</td>
                     <td align="center" class="graph10">Район добычи (зона, подзона)</td>
                     <td align="center" class="graph10">Сроки добычи</td>
                  </tr>
                  <xsl:for-each select="arm:ProductList">
                     <tr>
                        <td class="graph10">
                           <xsl:number count="arm:ProductList" format="1."/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:ProductType">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Weigh"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:ConversionFactor"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Quantity"/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:AreaMining">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:if test="arm:TimingExtraction">
                              <xsl:value-of select="arm:TimingExtraction"/> 
	<xsl:value-of select="arm:MeasurementUnitTime"/>
                           </xsl:if>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table></td>
            </tr>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="Action2">
      <xsl:variable name="Action" select="arm:Action"/>
      <xsl:choose>
         <xsl:when test="$Action=1">
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления   промышленного рыболовства в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:if test="arm:Resolution/arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:Resolution/arm:ResolutionNumber"/> 
	</xsl:if>
                  <xsl:for-each select="arm:Resolution/arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                  <xsl:if test="arm:Resolution/arm:Issued">
	выдано 
	<xsl:value-of select="arm:Resolution/arm:Issued"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr><td colspan="2">
               <table class="items" style="width:170mm">
                  <tr>
                     <td align="center" class="graph10">№ п/п</td>
                     <td align="center" class="graph10">Вид продукции</td>
                     <td align="center" class="graph10">Вес (нетто) кг</td>
                     <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
                     <td align="center" class="graph10">Объем использованного сырца, кг</td>
                     <td align="center" class="graph10">Район добычи (зона, подзона)</td>
                     <td align="center" class="graph10">Сроки добычи</td>
                     <td align="center" class="graph10">Грузополучатель (куда направлена или кому предназначена продукция)</td>
                  </tr>
                  <xsl:for-each select="arm:ProductList">
                     <tr>
                        <td class="graph10">
                           <xsl:number count="arm:ProductList" format="1."/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:ProductType">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Weigh"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:ConversionFactor"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Quantity"/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:AreaMining">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:if test="arm:TimingExtraction">
                              <xsl:value-of select="arm:TimingExtraction"/> 
	<xsl:value-of select="arm:MeasurementUnitTime"/>
                           </xsl:if>
                           <td class="graph10">
                              <xsl:for-each select="arm:Consignee">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table></td>
            </tr>
         </xsl:when>
         <xsl:when test="$Action=2">
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления  прибрежного рыболовства в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:if test="arm:Resolution/arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:Resolution/arm:ResolutionNumber"/> 
	</xsl:if>
                  <xsl:for-each select="arm:Resolution/arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                  <xsl:if test="arm:Resolution/arm:Issued">
	выдано 
	<xsl:value-of select="arm:Resolution/arm:Issued"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr><td colspan="2">
               <table class="items" style="width:170mm">
                  <tr>
                     <td align="center" class="graph10">№ п/п</td>
                     <td align="center" class="graph10">Вид продукции</td>
                     <td align="center" class="graph10">Вес (нетто) кг</td>
                     <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
                     <td align="center" class="graph10">Объем использованного сырца, кг</td>
                     <td align="center" class="graph10">Район добычи (зона, подзона)</td>
                     <td align="center" class="graph10">Сроки добычи</td>
                     <td align="center" class="graph10">Грузополучатель (куда направлена или кому предназначена продукция)</td>
                  </tr>
                  <xsl:for-each select="arm:ProductList">
                     <tr>
                        <td class="graph10">
                           <xsl:number count="arm:ProductList" format="1."/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:ProductType">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Weigh"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:ConversionFactor"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Quantity"/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:AreaMining">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:if test="arm:TimingExtraction">
                              <xsl:value-of select="arm:TimingExtraction"/> 
	<xsl:value-of select="arm:MeasurementUnitTime"/>
                           </xsl:if>
                           <td class="graph10">
                              <xsl:for-each select="arm:Consignee">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table></td>
            </tr>
         </xsl:when>
         <xsl:when test="$Action=3">
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:number count="arm:Registration" format="1."/>
	 В период с 
	<xsl:for-each select="arm:StartDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 по 
	<xsl:for-each select="arm:EndDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
	 в счет квот добычи (вылова)  водных  биоресурсов   для  осуществления  рыболовства в научно-исследовательских и контрольных целях в соответствии с разрешениями на добычу (вылов) водных биоресурсов 
	<xsl:if test="arm:Resolution/arm:ResolutionNumber">
	№ 
	<xsl:value-of select="arm:Resolution/arm:ResolutionNumber"/> 
	</xsl:if>
                  <xsl:for-each select="arm:Resolution/arm:ResolutionDate">
	от <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                  <xsl:if test="arm:Resolution/arm:Issued">
	выдано 
	<xsl:value-of select="arm:Resolution/arm:Issued"/>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(№ разрешений, кем выданы, дата выдачи)</td>
            </tr>
            <tr><td colspan="2">
               <table class="items" style="width:170mm">
                  <tr>
                     <td align="center" class="graph10">№ п/п</td>
                     <td align="center" class="graph10">Вид продукции</td>
                     <td align="center" class="graph10">Вес (нетто) кг</td>
                     <td align="center" class="graph10">Коэффициент пересчета готовой продукции в сырец</td>
                     <td align="center" class="graph10">Объем использованного сырца, кг</td>
                     <td align="center" class="graph10">Район добычи (зона, подзона)</td>
                     <td align="center" class="graph10">Сроки добычи</td>
                     <td align="center" class="graph10">Грузополучатель (куда направлена или кому предназначена продукция)</td>
                  </tr>
                  <xsl:for-each select="arm:ProductList">
                     <tr>
                        <td class="graph10">
                           <xsl:number count="arm:ProductList" format="1."/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:ProductType">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Weigh"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:ConversionFactor"/>
                        </td>
                        <td class="graph10">
                           <xsl:value-of select="arm:Quantity"/>
                        </td>
                        <td class="graph10">
                           <xsl:for-each select="arm:AreaMining">
                              <xsl:value-of select="."/> 
	</xsl:for-each>
                        </td>
                        <td class="graph10">
                           <xsl:if test="arm:TimingExtraction">
                              <xsl:value-of select="arm:TimingExtraction"/> 
	<xsl:value-of select="arm:MeasurementUnitTime"/>
                           </xsl:if>
                           <td class="graph10">
                              <xsl:for-each select="arm:Consignee">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                           </td>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table></td>
            </tr>
         </xsl:when>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="arm:ActRegistrationMining">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
	<head>
         <style type="text/css">
					body {
					background: #cccccc;
					}
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

                    table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    
                    </style>
	  </head>
	  <body>
		<div class="page">
         <xsl:variable name="Indicator" select="arm:OverloadUnloading"/>
         <xsl:choose>
            <xsl:when test="$Indicator='0'">
               <table style="width:170mm">
                  <tr>
                     <td align="center" class="graph12" colspan="2">ФЕДЕРАЛЬНАЯ СЛУЖБА БЕЗОПАСНОСТИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10" colspan="2">
                        <xsl:value-of select="arm:NameManagement"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(наименование пограничного управления береговой охраны (пограничного управления))</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph12" colspan="2">АКТ № 
	<xsl:value-of select="arm:RegistrationNumber/arm:NumberInspectors"/>-
	<xsl:value-of select="arm:RegistrationNumber/arm:SerialNumber"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph12" colspan="2">
                        <br>регистрации объемов добычи (вылова)</br>
                        <br>при выгрузке в порту (пункте выгрузки)</br>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:for-each select="arm:DateAct">
                           <xsl:call-template name="Date"/>
                        </xsl:for-each>
                     </td>
                     <td align="center" class="graph10">
                        <xsl:for-each select="arm:ExecutionPlace">
                           <xsl:call-template name="Address"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td/>
                     <td align="center" class="graph8">(место составления акта: пункт выгрузки)</td>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="2">Настоящий акт составлен в том, что при проверке выгрузки 
	судно: 
	<xsl:value-of select="arm:Vessel/arm:Name"/> 
	<xsl:if test="arm:Vessel/arm:Type">
	тип: 
	<xsl:value-of select="arm:Vessel/arm:Type"/> 
	</xsl:if>
                        <xsl:if test="arm:Vessel/arm:NumberBoard">
	бортовой номер: 
	<xsl:value-of select="arm:Vessel/arm:NumberBoard"/>
                        </xsl:if> 
	судовладелец: 
	<xsl:value-of select="arm:Vessel/arm:Shipowner/cat_ru:OrganizationName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(тип и название судна, бортовой номер и судовладелец)</td>
                  </tr>
                  <tr>
                     <td class="graph10">в период с 
	<xsl:for-each select="arm:StartDate">
                           <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                        <xsl:for-each select="arm:StartTime">
                           <xsl:call-template name="Time"/>
                        </xsl:for-each>
                     </td>
                     <td class="graph10"> по 
	<xsl:for-each select="arm:EndDate">
                           <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                        <xsl:for-each select="arm:EndTime">
                           <xsl:call-template name="Time"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(дата и время начала и окончания выгрузки)</td>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="2">зарегистрирован   следующий  объем  рыбного сырья и рыбопродукции,
добытой (произведенной) 
судно: 
<xsl:value-of select="arm:VesselExtracted/arm:Name"/> 
	<xsl:if test="arm:VesselExtracted/arm:Type">
	тип: 
	<xsl:value-of select="arm:VesselExtracted/arm:Type"/> 
	</xsl:if>
                        <xsl:if test="arm:VesselExtracted/arm:NumberBoard">
	бортовой номер: 
	<xsl:value-of select="arm:VesselExtracted/arm:NumberBoard"/>
                        </xsl:if> 
	судовладелец: 
	<xsl:value-of select="arm:VesselExtracted/arm:Shipowner/cat_ru:OrganizationName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(тип и название судна, бортовой номер и судовладелец)</td>
                  </tr>
                  <xsl:for-each select="arm:Registration">
                     <xsl:call-template name="Action"/>
                  </xsl:for-each>
               </table>
               <table style="width:170mm">
                  <xsl:for-each select="arm:InspectorSignature">
                     <tr>
                        <td align="center" class="graph10">
                           <xsl:value-of select="cat_ru:PersonPost"/>
                        </td>
                        <td align="center" class="graph10">________________</td>
                        <td align="center" class="graph10">
                           <xsl:value-of select="cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(инспектор)</td>
                        <td align="center" class="graph8">(подпись)</td>
                        <td align="center" class="graph8">(фамилия, инициалы)</td>
                     </tr>
                  </xsl:for-each>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonPost"/>
                     </td>
                     <td align="center" class="graph10">________________</td>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <tr>
                        <td align="center" class="graph8">(капитан судна)</td>
                        <td align="center" class="graph8">(подпись)</td>
                        <td align="center" class="graph8">(фамилия, инициалы)</td>
                     </tr>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="3">Сведения из акта переданы для регистрации в базе данных 
	<xsl:if test="arm:RegistrationDatabase">
                           <xsl:value-of select="arm:RegistrationDatabase/arm:TransferMethod"/>, 
	<xsl:for-each select="arm:RegistrationDatabase/arm:DateTransfer">
                              <xsl:call-template name="Date_2"/>, 
	</xsl:for-each>
                           <xsl:for-each select="arm:RegistrationDatabase/arm:TimeTransfer">
                              <xsl:call-template name="Time"/>
                           </xsl:for-each>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="3">(способ передачи, дата и время)</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonPost"/>
                     </td>
                     <td align="center" class="graph10">________________</td>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8">(должность)</td>
                     <td align="center" class="graph8">(подпись)</td>
                     <td align="center" class="graph8">(фамилия, инициалы)</td>
                  </tr>
               </table>
            </xsl:when>
            <xsl:otherwise>
               <table style="width:170mm">
                  <tr>
                     <td align="center" class="graph12" colspan="2">ФЕДЕРАЛЬНАЯ СЛУЖБА БЕЗОПАСНОСТИ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10" colspan="2">
                        <xsl:value-of select="arm:NameManagement"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(наименование пограничного управления береговой охраны (пограничного управления))</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph12" colspan="2">АКТ № 
	<xsl:value-of select="arm:RegistrationNumber/arm:NumberInspectors"/>-
	<xsl:value-of select="arm:RegistrationNumber/arm:SerialNumber"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph12" colspan="2">
                        <br>регистрации объемов добычи (вылова)</br>
                        <br>при перегрузке промысловым судном</br>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:for-each select="arm:DateAct">
                           <xsl:call-template name="Date"/>
                        </xsl:for-each>
                     </td>
                     <td align="center" class="graph10">
                        <xsl:for-each select="arm:ExecutionPlace">
                           <xsl:call-template name="Address"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td/>
                     <td align="center" class="graph8">(место составления акта, координаты)</td>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="2">Настоящий акт составлен в том, что при проверке перегрузки 
	судно: 
	<xsl:value-of select="arm:Vessel/arm:Name"/> 
	<xsl:if test="arm:Vessel/arm:Type">
	тип: 
	<xsl:value-of select="arm:Vessel/arm:Type"/> 
	</xsl:if>
                        <xsl:if test="arm:Vessel/arm:NumberBoard">
	бортовой номер: 
	<xsl:value-of select="arm:Vessel/arm:NumberBoard"/>
                        </xsl:if> 
	судовладелец: 
	<xsl:value-of select="arm:Vessel/arm:Shipowner/cat_ru:OrganizationName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(тип и название передающего судна, бортовой номер и судовладелец)</td>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="2">судно: 
	<xsl:value-of select="arm:ReceivingVessel/arm:Name"/> 
	<xsl:if test="arm:ReceivingVessel/arm:Type">
	тип: 
	<xsl:value-of select="arm:ReceivingVessel/arm:Type"/> 
	</xsl:if>
                        <xsl:if test="arm:ReceivingVessel/arm:NumberBoard">
	бортовой номер: 
	<xsl:value-of select="arm:ReceivingVessel/arm:NumberBoard"/>
                        </xsl:if> 
	судовладелец: 
	<xsl:value-of select="arm:ReceivingVessel/arm:Shipowner/cat_ru:OrganizationName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(тип и название принимающего судна, бортовой номер и судовладелец)</td>
                  </tr>
                  <tr>
                     <td class="graph10">в период с 
	<xsl:for-each select="arm:StartDate">
                           <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                        <xsl:for-each select="arm:StartTime">
                           <xsl:call-template name="Time"/>
                        </xsl:for-each>
                     </td>
                     <td class="graph10"> по 
	<xsl:for-each select="arm:EndDate">
                           <xsl:call-template name="Date_2"/> 
	</xsl:for-each>
                        <xsl:for-each select="arm:EndTime">
                           <xsl:call-template name="Time"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="2">(дата и время начала и окончания выгрузки)</td>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="2">зарегистрирован   следующий  объем  рыбного сырья и рыбопродукции,
добытой (произведенной) 
судно: 
<xsl:value-of select="arm:VesselExtracted/arm:Name"/> 
	<xsl:if test="arm:VesselExtracted/arm:Type">
	тип: 
	<xsl:value-of select="arm:VesselExtracted/arm:Type"/> 
	</xsl:if>
                        <xsl:if test="arm:VesselExtracted/arm:NumberBoard">
	бортовой номер: 
	<xsl:value-of select="arm:VesselExtracted/arm:NumberBoard"/>
                        </xsl:if> 
	судовладелец: 
	<xsl:value-of select="arm:VesselExtracted/arm:Shipowner/cat_ru:OrganizationName"/>
                     </td>
                  </tr>
                  <xsl:for-each select="arm:Registration">
                     <xsl:call-template name="Action2"/>
                  </xsl:for-each>
               </table>
               <table style="width:170mm">
                  <xsl:for-each select="arm:InspectorSignature">
                     <tr>
                        <td align="center" class="graph10">
                           <xsl:value-of select="cat_ru:PersonPost"/>
                        </td>
                        <td align="center" class="graph10">________________</td>
                        <td align="center" class="graph10">
                           <xsl:value-of select="cat_ru:PersonSurname"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonName"/>
                           <xsl:text> </xsl:text>
                           <xsl:value-of select="cat_ru:PersonMiddleName"/>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph8">(инспектор)</td>
                        <td align="center" class="graph8">(подпись)</td>
                        <td align="center" class="graph8">(фамилия, инициалы)</td>
                     </tr>
                  </xsl:for-each>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonPost"/>
                     </td>
                     <td align="center" class="graph10">________________</td>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:ShipmasterSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <tr>
                        <td align="center" class="graph8">(капитан передающего судна)</td>
                        <td align="center" class="graph8">(подпись)</td>
                        <td align="center" class="graph8">(фамилия, инициалы)</td>
                     </tr>
                  </tr>
                  <tr>
                     <td class="graph10" colspan="3">Сведения из акта переданы для регистрации в базе данных 
	<xsl:if test="arm:RegistrationDatabase">
                           <xsl:value-of select="arm:RegistrationDatabase/arm:TransferMethod"/>, 
	<xsl:for-each select="arm:RegistrationDatabase/arm:DateTransfer">
                              <xsl:call-template name="Date_2"/>, 
	</xsl:for-each>
                           <xsl:for-each select="arm:RegistrationDatabase/arm:TimeTransfer">
                              <xsl:call-template name="Time"/>
                           </xsl:for-each>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8" colspan="3">(способ передачи, дата и время)</td>
                  </tr>
                  <tr>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonPost"/>
                     </td>
                     <td align="center" class="graph10">________________</td>
                     <td align="center" class="graph10">
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="arm:RegistrationDatabase/arm:PersonSignature/cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <td align="center" class="graph8">(должность)</td>
                     <td align="center" class="graph8">(подпись)</td>
                     <td align="center" class="graph8">(фамилия, инициалы)</td>
                  </tr>
               </table>
            </xsl:otherwise>
         </xsl:choose>
         </div>
	  </body>
	</html>  
   </xsl:template>
</xsl:stylesheet>
