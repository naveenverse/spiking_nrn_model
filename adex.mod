NEURON {
	POINT_PROCESS ADEX
	RANGE C,s,i,gl,el,delT,Vt,I,Ex,In,cou_gnmda,mod_cou_gnmda
	RANGE Vr,vrest,a,b,tw,fflag,thresh,thresh1,Gmax,Onset
	RANGE weighti,nspike,gmax,gnmda,Isyn,ISYN,Talp,talp,onset
	RANGE transmembranecurrent,t
	RANGE gampa,gampa1,gampa2,gampa3
	RANGE ggaba,ggaba1,ggaba2,ggaba3
}

INITIAL {
	vv=-70
	w=0
	gampa=0
	gampa1=0
	gampa2=0
	gampa3=0
	:gnmda=0
	net_send(0,1)
}

PARAMETER {
	Ex=0
	In=0
	C=150:77
	nspike=0
	weighti=0
	onset=20
	Onset=24
	gl=10
	el=-70
	delT=4
	thresh=15
	thresh1=11
	Vt=-50
	I=0
	Vr=-64
	vrest=-70
	a=9:81
	b=250:175
	tw=13:385                                                                     	
	fflag=1
	gmax=7.78
	talp=6.6:5.169
	Gmax=10
	Talp=3.5
}

STATE { w vv }

ASSIGNED {
	s
	i
	gampa 
	ggaba
	ggaba1
	ggaba2
	ggaba3
	cou_gnmda
	mod_cou_gnmda
	gampa1
	gampa2
	gampa3
	gnmda
	Isyn
	ISYN
	transmembranecurrent
	
}

BREAKPOINT {
	SOLVE states METHOD derivimplicit
}

DERIVATIVE states {
	if (gnmda==1 && In==0) {
			if (t>=onset) {
			:net_send(0,4)
			gampa=gmax*(t/talp)*exp(1-t/talp)
			ggaba=0
			}
	}
	if (gnmda==2 && In==0) {
			if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
				gampa1=gmax*(t/talp)*exp(1-t/talp)
				gampa=gampa+gampa1
				ggaba=0
			}
	}
	if (gnmda==3 && In==0) {
			if (t>=onset) {
		        	gampa=gmax*(t/talp)*exp(1-t/talp)
                        	gampa1=gmax*(t/talp)*exp(1-t/talp)
				gampa2=gmax*(t/talp)*exp(1-t/talp)
                        	gampa=gampa+gampa1+gampa2
					ggaba=0	
			}
	}
	if (gnmda==4 && In==0) {
			if (t>=onset) {
				gampa=0
				gampa1=0
				gampa2=0
				gampa3=0
                        	gampa=gmax*(t/talp)*exp(1-t/talp)
                        	gampa1=gmax*(t/talp)*exp(1-t/talp)
                        	gampa2=gmax*(t/talp)*exp(1-t/talp)
				gampa3=gmax*(t/talp)*exp(1-t/talp)
                        	gampa=gampa+gampa1+gampa2+gampa3  
			:		ggaba=0
                	}
	}
	if (gnmda==1 && In==1) {
		Talp=3
		if (t>=onset) {
                        	gampa=gmax*(t/talp)*exp(1-t/talp)
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
			}
		}
	}
	if (gnmda==1 && In==2) {
		Talp=3
		if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba=ggaba+ggaba1
			}
		}
	}
	if (gnmda==1 && In==3) {	
		Talp=3
		if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba=ggaba+ggaba1+ggaba2
			}
		}
	}
	if (gnmda==1 && In==4) {
		Talp=3
		if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba3=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2+ggaba3
			}
		}
	}
	if (gnmda==2 && In==1) {	
		Talp=3.2
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
			}
                }
	}
	if (gnmda==2 && In==2) {
		Talp=3.2
		if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1
			if (t>=Onset) {
				ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba=ggaba+ggaba1
			}
		}
	}
	if (gnmda==2 && In==3) {
		Talp=3.2
		if (t>=onset) {
				gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1
			if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2
                        }
		}
	}
	if (gnmda==2 && In==4) {
		Talp=3.2
		if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1
			if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba3=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2+ggaba3
                        }
		}
	}
	if (gnmda==3 && In==1) {
		thresh=11.4
		Talp=3.4
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
				gampa1=gmax*(t/talp)*exp(1-t/talp)
				gampa2=gmax*(t/talp)*exp(1-t/talp)
				gampa=gampa+gampa1+gampa2
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                        }
                }
	}
	if (gnmda==3 && In==2) {
		Talp=3.4
		thresh=8.6
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
				gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1
                        }
                }
	}
	if (gnmda==3 && In==3) {
		Talp=3.4
		thresh=6
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
				gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba=ggaba+ggaba1+ggaba2
			}
		}
	}
	if (gnmda==3 && In==4) {
		Talp=3.4
		thresh=3.27
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba3=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2+ggaba3
                        }
                }
	}
	if (gnmda==4 && In==1) {
		C=1000
		talp=2.66
		Talp=3.5
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
				gampa3=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2+gampa3
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                        }
                }
	}
	if (gnmda==4 && In==2) {
		C=1000
                talp=2.61
                Talp=3.5
                if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
				gampa3=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2+gampa3
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1
                        }
		}
	}
	if (gnmda==4 && In==3) {
		C=1000
                talp=2.61
                Talp=3.5
		if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
                                gampa3=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2+gampa3
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2
                        }
                }
	}
	if (gnmda==4 && In==4) {
		C=1000
                talp=2.61
                Talp=3.5
		if (t>=onset) {
                                gampa=gmax*(t/talp)*exp(1-t/talp)
                                gampa1=gmax*(t/talp)*exp(1-t/talp)
                                gampa2=gmax*(t/talp)*exp(1-t/talp)
                                gampa3=gmax*(t/talp)*exp(1-t/talp)
                                gampa=gampa+gampa1+gampa2+gampa3
                        if (t>=Onset) {
                                ggaba=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba1=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba2=Gmax*(t/Talp)*exp(1-t/Talp)
				ggaba3=Gmax*(t/Talp)*exp(1-t/Talp)
                                ggaba=ggaba+ggaba1+ggaba2+ggaba3
                        }
                }
	}
		Isyn=gampa*(vrest-0)
		ISYN=ggaba*(vrest+80)
                vv'=(gl*(el-vv)+gl*delT*exp((vv-Vt)/delT)+I-w)/C-(Isyn+ISYN):gampa*(vrest-0)	
			transmembranecurrent=(gl*(el-vv)+gl*delT*exp((vv-Vt)/delT))*C
		:printf("hi%f\n",transmembranecurrent)

   	        w'=(a*(vv-el)-w)/tw
:wopen("file.dat")

}


NET_RECEIVE (u) {
	INITIAL {
		gnmda=0
	}
	if (flag == 1) {
			WATCH (vv>thresh) 2
	} else if (flag == 2) {
		net_event(t)
		vv=Vr
		w=w+b
		nspike=nspike+1
			if (nspike > 0) {
				WATCH (vv>thresh1) 3
			}
	printf("The number of spikes is %f\n",nspike)
	} else if (flag == 3) {
		net_event(t)
		vv=Vr
		w=w+b
	}else {	:synaptic activation
		gnmda=gnmda+1
		printf("The gnmda value is %f\n",gnmda)
		COMMENT
		s=0
		if (gnmda <= 4) {
			s=s+1
			printf("the s value is %f\n",s)
			:cou_gnmda=gnmda
		}else if (gnmda > 4) {
			:printf("i m here\n")
			:mod_cou_gnmda=gnmda-cou_gnmda
			:cou_gnmda=mod_cou_gnmda
			:gnmda=cou_gnmda
		}
		printf("the value of s is %f\n",s)
		:if (Ex==4) {
		:	gnmda=4
		:}else if (Ex==3) {
		:	gnmda=3
		:}else if (Ex==2) {
		:	gnmda=2
		:}else if (Ex==1) {
		:	gnmda=1
		:}
		ENDCOMMENT
	}
}
