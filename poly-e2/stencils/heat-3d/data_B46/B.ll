; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #0 {
entry:
  br i1 true, label %for.body.us.preheader, label %for.end24

for.body.us.preheader:                            ; preds = %entry
  br label %for.body3.us.us.preheader

for.body3.us.us.preheader:                        ; preds = %for.body.us.preheader, %for.cond1.for.inc22_crit_edge.us
  %indvars.iv49 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next50, %for.cond1.for.inc22_crit_edge.us ]
  br label %for.body3.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count48.pre-phi
  br i1 %exitcond52, label %for.end24.loopexit, label %for.body3.us.us.preheader

for.body3.us.us:                                  ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.body3.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next46, %for.cond4.for.inc19_crit_edge.us.us ]
  %0 = add nuw nsw i64 %indvars.iv45, %indvars.iv49
  %1 = trunc i64 %0 to i32
  %add.us.us = add i32 %1, 120
  br i1 true, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, 1.200000e+02
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv49, i64 %indvars.iv45, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv49, i64 %indvars.iv45, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body6.us.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol.preheader ], [ 0, %for.body3.us.us ]
  br i1 false, label %for.cond4.for.inc19_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  %2 = sub nsw i64 118, %indvars.iv.unr.ph
  %3 = and i64 %2, -2
  br label %for.body6.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  %4 = or i64 %indvars.iv.unr.ph, 2
  %5 = add nsw i64 %4, %3
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.cond4.for.inc19_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count48.pre-phi = phi i64 [ 1, %for.body6.us.us.prol.loopexit.unr-lcssa ], [ %5, %for.cond4.for.inc19_crit_edge.us.us.loopexit ]
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count48.pre-phi
  br i1 %exitcond, label %for.cond1.for.inc22_crit_edge.us, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %6
  %conv.us.us = sitofp i32 %add7.us.us to double
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv49, i64 %indvars.iv45, i64 %indvars.iv
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv49, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %7
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %mul.us.us.v.i0.2 = insertelement <2 x double> %mul.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %mul.us.us = fmul <2 x double> %mul.us.us.v.i0.2, <double 1.000000e+01, double 1.000000e+01>
  %div.us.us = fdiv <2 x double> %mul.us.us, <double 1.200000e+02, double 1.200000e+02>
  %8 = bitcast double* %arrayidx12.us.us to <2 x double>*
  %9 = bitcast double* %arrayidx18.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %8, align 8
  store <2 x double> %div.us.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.inc209, %for.body.lr.ph
  %inc21045 = phi i32 [ 1, %for.body.lr.ph ], [ %inc210, %for.inc209 ]
  br i1 true, label %for.body7.us.preheader.preheader, label %for.inc209

for.body7.us.preheader.preheader:                 ; preds = %for.body
  br label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %for.inc98, %for.body7.us.preheader.preheader
  %indvars.iv65 = phi i64 [ 1, %for.body7.us.preheader.preheader ], [ %indvars.iv.next66, %for.inc98 ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %0 = add nsw i64 %indvars.iv65, -1
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.cond8.for.inc95_crit_edge.us, %for.body7.us.preheader
  %indvars.iv48 = phi i64 [ 1, %for.body7.us.preheader ], [ %indvars.iv.next49, %for.cond8.for.inc95_crit_edge.us ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %1 = add nsw i64 %indvars.iv48, -1
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.body7.us
  %indvars.iv = phi i64 [ 1, %for.body7.us ], [ %indvars.iv.next, %for.body11.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next66, i64 %indvars.iv48, i64 %indvars.iv
  %2 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv65, i64 %indvars.iv48, i64 %indvars.iv
  %3 = load double, double* %arrayidx21.us, align 8
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv48, i64 %indvars.iv
  %4 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv65, i64 %indvars.iv.next49, i64 %indvars.iv
  %5 = load double, double* %arrayidx38.us, align 8
  %6 = insertelement <2 x double> undef, double %3, i32 0
  %mul.v.i1.2.us = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %mul.us = fmul <2 x double> %mul.v.i1.2.us, <double 2.000000e+00, double 2.000000e+00>
  %sub22.v.i0.1.us = insertelement <2 x double> undef, double %2, i32 0
  %sub22.v.i0.2.us = insertelement <2 x double> %sub22.v.i0.1.us, double %5, i32 1
  %sub22.us = fsub <2 x double> %sub22.v.i0.2.us, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv65, i64 %1, i64 %indvars.iv
  %7 = load double, double* %arrayidx53.us, align 8
  %add30.v.i1.1.us = insertelement <2 x double> undef, double %4, i32 0
  %add30.v.i1.2.us = insertelement <2 x double> %add30.v.i1.1.us, double %7, i32 1
  %add30.us = fadd <2 x double> %sub22.us, %add30.v.i1.2.us
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1.us = extractelement <2 x double> %mul31.us, i32 0
  %mul31.v.r2.us = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.v.r1.us, %mul31.v.r2.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv65, i64 %indvars.iv48, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx63.us, align 8
  %mul70.us = fmul double %3, 2.000000e+00
  %sub71.us = fsub double %8, %mul70.us
  %9 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv65, i64 %indvars.iv48, i64 %9
  %10 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %10
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %add81.us, %3
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv65, i64 %indvars.iv48, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us, label %for.body11.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.body11.us
  %exitcond52 = icmp eq i64 %indvars.iv.next49, 119
  br i1 %exitcond52, label %for.inc98, label %for.body7.us

for.inc98:                                        ; preds = %for.cond8.for.inc95_crit_edge.us
  %exitcond69 = icmp eq i64 %indvars.iv.next66, 119
  br i1 %exitcond69, label %for.end100, label %for.body7.us.preheader

for.end100:                                       ; preds = %for.inc98
  br i1 true, label %for.body108.us.preheader.preheader, label %for.end100.for.inc209_crit_edge

for.end100.for.inc209_crit_edge:                  ; preds = %for.end100
  br label %for.inc209

for.body108.us.preheader.preheader:               ; preds = %for.end100
  br label %for.body108.us.preheader

for.body108.us.preheader:                         ; preds = %for.inc206, %for.body108.us.preheader.preheader
  %indvars.iv70 = phi i64 [ 1, %for.body108.us.preheader.preheader ], [ %indvars.iv.next71, %for.inc206 ]
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %11 = add nsw i64 %indvars.iv70, -1
  br label %for.body108.us

for.body108.us:                                   ; preds = %for.cond109.for.inc203_crit_edge.us, %for.body108.us.preheader
  %indvars.iv59 = phi i64 [ 1, %for.body108.us.preheader ], [ %indvars.iv.next60, %for.cond109.for.inc203_crit_edge.us ]
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %12 = add nsw i64 %indvars.iv59, -1
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us, %for.body108.us
  %indvars.iv54 = phi i64 [ 1, %for.body108.us ], [ %indvars.iv.next55, %for.body112.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next71, i64 %indvars.iv59, i64 %indvars.iv54
  %13 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv70, i64 %indvars.iv59, i64 %indvars.iv54
  %14 = load double, double* %arrayidx125.us, align 8
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %11, i64 %indvars.iv59, i64 %indvars.iv54
  %15 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv70, i64 %indvars.iv.next60, i64 %indvars.iv54
  %16 = load double, double* %arrayidx143.us, align 8
  %17 = insertelement <2 x double> undef, double %14, i32 0
  %mul126.v.i1.2.us = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %mul126.us = fmul <2 x double> %mul126.v.i1.2.us, <double 2.000000e+00, double 2.000000e+00>
  %sub127.v.i0.1.us = insertelement <2 x double> undef, double %13, i32 0
  %sub127.v.i0.2.us = insertelement <2 x double> %sub127.v.i0.1.us, double %16, i32 1
  %sub127.us = fsub <2 x double> %sub127.v.i0.2.us, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv70, i64 %12, i64 %indvars.iv54
  %18 = load double, double* %arrayidx158.us, align 8
  %add135.v.i1.1.us = insertelement <2 x double> undef, double %15, i32 0
  %add135.v.i1.2.us = insertelement <2 x double> %add135.v.i1.1.us, double %18, i32 1
  %add135.us = fadd <2 x double> %sub127.us, %add135.v.i1.2.us
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1.us = extractelement <2 x double> %mul136.us, i32 0
  %mul136.v.r2.us = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.v.r1.us, %mul136.v.r2.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv70, i64 %indvars.iv59, i64 %indvars.iv.next55
  %19 = load double, double* %arrayidx168.us, align 8
  %mul175.us = fmul double %14, 2.000000e+00
  %sub176.us = fsub double %19, %mul175.us
  %20 = add nsw i64 %indvars.iv54, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv70, i64 %indvars.iv59, i64 %20
  %21 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %21
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %add186.us, %14
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv70, i64 %indvars.iv59, i64 %indvars.iv54
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond58 = icmp eq i64 %indvars.iv.next55, 119
  br i1 %exitcond58, label %for.cond109.for.inc203_crit_edge.us, label %for.body112.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.body112.us
  %exitcond63 = icmp eq i64 %indvars.iv.next60, 119
  br i1 %exitcond63, label %for.inc206, label %for.body108.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %exitcond74 = icmp eq i64 %indvars.iv.next71, 119
  br i1 %exitcond74, label %for.inc209.loopexit, label %for.body108.us.preheader

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.end100.for.inc209_crit_edge, %for.body
  %inc210 = add nuw nsw i32 %inc21045, 1
  %exitcond64 = icmp eq i32 %inc210, 501
  br i1 %exitcond64, label %for.end211, label %for.body

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [120 x [120 x double]]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %for.end23

for.body.us.preheader:                            ; preds = %entry
  br label %for.body4.us.us.preheader

for.body4.us.us.preheader:                        ; preds = %for.body.us.preheader, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv49 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next50, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nsw i64 120, %indvars.iv49
  %4 = trunc i64 %3 to i32
  br label %for.body4.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next50, 120
  br i1 %exitcond53, label %for.end23.loopexit, label %for.body4.us.us.preheader

for.body4.us.us:                                  ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.body4.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.body4.us.us.preheader ], [ %indvars.iv.next46, %for.cond5.for.inc18_crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv45 to i32
  %mul8.us43 = add i32 %5, %4
  %add.us.us = mul i32 %mul8.us43, 120
  %6 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 120
  br i1 %exitcond48, label %for.cond2.for.inc21_crit_edge.us, label %for.body4.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.body4.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.body4.us.us ]
  %7 = add i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %rem.us.us = srem i32 %8, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #4
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv49, i64 %indvars.iv45, i64 %indvars.iv
  %11 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
