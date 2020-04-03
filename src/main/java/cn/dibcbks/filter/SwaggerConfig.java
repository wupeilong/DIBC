package cn.dibcbks.filter;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import io.swagger.annotations.ApiOperation;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author: wupeilong
 * @version: v1.0.0
 * @ClassName: SwaggerConfig
 * @Description: Swagger工具类
 * @Date: 2020-04-01 15:46
 */
@Configuration
@EnableSwagger2
@EnableWebMvc
public class SwaggerConfig {
	 @Bean
	 public Docket createRestApi() {
		 return new Docket(DocumentationType.SWAGGER_2)
	                .apiInfo(apiInfo()).select()
	                //扫描指定包中的swagger注解
	                //.apis(RequestHandlerSelectors.basePackage("cn.dibcbks.controller"))
	                //扫描所有有注解的api，用这种方式更灵活
	                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
	                .paths(PathSelectors.any())
	                .build();
	}

	    private ApiInfo apiInfo() {
	        return new ApiInfoBuilder()
	                .title("明厨亮灶项目后台API接口文档")
	                .description("DIBC_BKS API DOUCMENT TEST")
	                .termsOfServiceUrl("https://www.baidu.com/")
	                .license("gm1992@163.com")
	                .version("1.0.0")
	                .build();
	    }
}
