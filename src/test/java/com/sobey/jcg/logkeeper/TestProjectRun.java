package com.sobey.jcg.logkeeper;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sobey.jcg.sobeyhive.commons.restful.RestResult;
import com.sobey.jcg.sobeyhive.commons.restful.annotation.RestUrlCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * Created by WX on 2017/4/18.
 *
 */
@RestController
@Api(description = "测试")
public class TestProjectRun {

    @RequestMapping(path ="/testrun", method = RequestMethod.GET,consumes = "application/json;charset=UTF-8")
    @ApiOperation(value = "测试", notes = "测试")
    @RestUrlCode("I002003001")
    public RestResult<String> test(@RequestParam(name = "op") String op) {
        RestResult<String> result = new RestResult<>();
        result.setMessage(op);
        result.setStatus(200);
        result.setResult("df");
        return result;
    }
}
