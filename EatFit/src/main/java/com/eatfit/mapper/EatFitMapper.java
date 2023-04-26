package com.eatfit.mapper;

import com.eatfit.entity.Member;

public interface EatFitMapper {

	public int join(Member vo);
	public Member login(Member vo);
}
