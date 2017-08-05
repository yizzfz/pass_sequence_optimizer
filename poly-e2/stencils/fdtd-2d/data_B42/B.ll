; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) unnamed_addr #2 {
entry:
  br label %for.body.prol

for.body.prol:                                    ; preds = %entry, %for.body.prol
  %indvars.iv12.prol = phi i64 [ %indvars.iv.next13.prol, %for.body.prol ], [ 0, %entry ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv12.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv12.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.preheader, label %for.body.prol, !llvm.loop !1

for.body.preheader:                               ; preds = %for.body.prol
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.end38_crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond5.for.end38_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv7 to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv7, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 2
  %5 = trunc i64 %4 to i32
  %conv18.us = sitofp i32 %5 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv7, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv7, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond17, label %for.cond5.for.end38_crit_edge.us, label %for.body8.us

for.cond5.for.end38_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.7, %for.body ], [ 4, %for.body.preheader ]
  %8 = trunc i64 %indvars.iv12 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv12
  %9 = bitcast double* %arrayidx to <2 x double>*
  %10 = trunc i64 %indvars.iv12 to i32
  %11 = or i32 %10, 1
  %conv.1 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv, i32 0
  %13 = insertelement <2 x double> %12, double %conv.1, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next13.1 = or i64 %indvars.iv12, 2
  %14 = trunc i64 %indvars.iv.next13.1 to i32
  %conv.2 = sitofp i32 %14 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next13.1
  %15 = bitcast double* %arrayidx.2 to <2 x double>*
  %16 = trunc i64 %indvars.iv12 to i32
  %17 = or i32 %16, 3
  %conv.3 = sitofp i32 %17 to double
  %18 = insertelement <2 x double> undef, double %conv.2, i32 0
  %19 = insertelement <2 x double> %18, double %conv.3, i32 1
  store <2 x double> %19, <2 x double>* %15, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %20 = trunc i64 %indvars.iv.next13.3 to i32
  %conv.4 = sitofp i32 %20 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next13.3
  %21 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  %22 = trunc i64 %indvars.iv.next13.4 to i32
  %conv.5 = sitofp i32 %22 to double
  %23 = insertelement <2 x double> undef, double %conv.4, i32 0
  %24 = insertelement <2 x double> %23, double %conv.5, i32 1
  store <2 x double> %24, <2 x double>* %21, align 8
  %indvars.iv.next13.5 = add nsw i64 %indvars.iv12, 6
  %25 = trunc i64 %indvars.iv.next13.5 to i32
  %conv.6 = sitofp i32 %25 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next13.5
  %26 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next13.6 = add nsw i64 %indvars.iv12, 7
  %27 = trunc i64 %indvars.iv.next13.6 to i32
  %conv.7 = sitofp i32 %27 to double
  %28 = insertelement <2 x double> undef, double %conv.6, i32 0
  %29 = insertelement <2 x double> %28, double %conv.7, i32 1
  store <2 x double> %29, <2 x double>* %26, align 8
  %indvars.iv.next13.7 = add nsw i64 %indvars.iv12, 8
  %exitcond15.7 = icmp eq i64 %indvars.iv.next13.7, 500
  br i1 %exitcond15.7, label %for.cond5.preheader.us.preheader, label %for.body

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.end38_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end112, %entry
  %indvars.iv47 = phi i64 [ 0, %entry ], [ %indvars.iv.next48, %for.end112 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.end33_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.end33_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond10.for.end33_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add nsw i64 %indvars.iv22, -1
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 1200
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep155 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %0, i64 1200
  %bound0157 = icmp ult double* %scevgep146, %scevgep155
  %bound1158 = icmp ult double* %scevgep152, %scevgep149
  %memcheck.conflict160 = and i1 %bound0157, %bound1158
  br i1 %memcheck.conflict160, label %for.body12.us.preheader, label %vector.body136.preheader

vector.body136.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body136

vector.body136:                                   ; preds = %vector.body136.preheader, %vector.body136
  %index163 = phi i64 [ %index.next164, %vector.body136 ], [ 0, %vector.body136.preheader ]
  %2 = shl i64 %index163, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %2
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec172 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec173 = shufflevector <4 x double> %wide.vec172, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec174 = shufflevector <4 x double> %wide.vec172, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %2
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec175 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %2
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec178 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec175, %wide.vec178
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec173, %11
  %13 = or i64 %2, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %13
  %15 = fsub <4 x double> %wide.vec175, %wide.vec178
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec174, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec181 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec181, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next164 = add i64 %index163, 2
  %21 = icmp eq i64 %index.next164, 600
  br i1 %21, label %middle.block137, label %vector.body136, !llvm.loop !8

middle.block137:                                  ; preds = %vector.body136
  br label %for.cond10.for.end33_crit_edge.us

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %indvars.iv16
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %indvars.iv16
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv16
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next17 = or i64 %indvars.iv16, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %indvars.iv.next17
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %indvars.iv.next17
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv.next17
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next17.1 = add nuw nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.end33_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !11

for.cond10.for.end33_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.end33_crit_edge.us

for.cond10.for.end33_crit_edge.us:                ; preds = %for.cond10.for.end33_crit_edge.us.loopexit, %middle.block137
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next23, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond52, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.end33_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr182 = mul i64 %indvars.iv47, 8
  %sunkaddr183 = add i64 %sunkaddr, %sunkaddr182
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to i64*
  %28 = load i64, i64* %sunkaddr184, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr185 = ptrtoint double* %_fict_ to i64
  %sunkaddr186 = mul i64 %indvars.iv47, 8
  %sunkaddr187 = add i64 %sunkaddr185, %sunkaddr186
  %sunkaddr188 = inttoptr i64 %sunkaddr187 to i64*
  %30 = load i64, i64* %sunkaddr188, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %sunkaddr189 = ptrtoint double* %_fict_ to i64
  %sunkaddr190 = mul i64 %indvars.iv47, 8
  %sunkaddr191 = add i64 %sunkaddr189, %sunkaddr190
  %sunkaddr192 = inttoptr i64 %sunkaddr191 to i64*
  %32 = load i64, i64* %sunkaddr192, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %sunkaddr193 = ptrtoint double* %_fict_ to i64
  %sunkaddr194 = mul i64 %indvars.iv47, 8
  %sunkaddr195 = add i64 %sunkaddr193, %sunkaddr194
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to i64*
  %34 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1200
  br i1 %exitcond.3, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.end65_crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.cond40.for.end65_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 1
  %36 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 1
  %37 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 0
  %38 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %37, %38
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %36, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 2
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 1200
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 1
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 1200
  %bound0116 = icmp ult double* %scevgep105, %scevgep114
  %bound1117 = icmp ult double* %scevgep111, %scevgep108
  %memcheck.conflict119 = and i1 %bound0116, %bound1117
  br i1 %memcheck.conflict119, label %for.body42.us.preheader, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99.preheader, %vector.body99
  %index122 = phi i64 [ %index.next123, %vector.body99 ], [ 0, %vector.body99.preheader ]
  %39 = shl i64 %index122, 1
  %offset.idx = or i64 %39, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 %offset.idx
  %41 = bitcast double* %40 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %41, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec129 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %offset.idx
  %43 = getelementptr double, double* %42, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec130 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !15
  %strided.vec131 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec132 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fsub <2 x double> %strided.vec132, %strided.vec131
  %46 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %47 = fsub <2 x double> %strided.vec, %46
  %48 = or i64 %39, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %48
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec133 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !15
  %strided.vec134 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec135 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fsub <2 x double> %strided.vec135, %strided.vec134
  %54 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %strided.vec129, %54
  %56 = getelementptr double, double* %49, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %47, <2 x double> %55, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %57, align 8, !alias.scope !12, !noalias !15
  %index.next123 = add i64 %index122, 2
  %58 = icmp eq i64 %index.next123, 598
  br i1 %58, label %middle.block100, label %vector.body99, !llvm.loop !17

middle.block100:                                  ; preds = %vector.body99
  br label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %middle.block100, %for.cond40.preheader.us
  %indvars.iv27.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %middle.block100 ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %for.body42.us ], [ %indvars.iv27.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 %indvars.iv27
  %59 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %indvars.iv27
  %60 = load double, double* %arrayidx50.us, align 8
  %61 = add nsw i64 %indvars.iv27, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %61
  %62 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %60, %62
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %59, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next28 = or i64 %indvars.iv27, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv34, i64 %indvars.iv.next28
  %63 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %indvars.iv.next28
  %64 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv34, i64 %indvars.iv27
  %65 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %64, %65
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %63, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, 1200
  br i1 %exitcond31.1, label %for.cond40.for.end65_crit_edge.us, label %for.body42.us, !llvm.loop !18

for.cond40.for.end65_crit_edge.us:                ; preds = %for.body42.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.end65_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.end109_crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond73.for.end109_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv43, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv43, i64 1199
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv43, i64 0
  %66 = add i64 %indvars.iv43, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %66, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv43, i64 0
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %66, i64 1199
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %bound0 = icmp ult double* %scevgep, %scevgep80
  %bound1 = icmp ult double* %scevgep78, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound086 = icmp ult double* %scevgep, %scevgep84
  %bound187 = icmp ult double* %scevgep82, %scevgep76
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx = or i1 %found.conflict, %found.conflict88
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv43, i64 %index
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !19, !noalias !22
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !19, !noalias !22
  %71 = or i64 %index, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv43, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !25
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !25
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv43, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !25
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !25
  %80 = fsub <2 x double> %wide.load91, %wide.load93
  %81 = fsub <2 x double> %wide.load92, %wide.load94
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next44, i64 %index
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !26
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !26
  %86 = fadd <2 x double> %80, %wide.load95
  %87 = fadd <2 x double> %81, %wide.load96
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv43, i64 %index
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !26
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !26
  %92 = fsub <2 x double> %86, %wide.load97
  %93 = fsub <2 x double> %87, %wide.load98
  %94 = fmul <2 x double> %92, <double 7.000000e-01, double 7.000000e-01>
  %95 = fmul <2 x double> %93, <double 7.000000e-01, double 7.000000e-01>
  %96 = fsub <2 x double> %wide.load, %94
  %97 = fsub <2 x double> %wide.load90, %95
  %98 = bitcast double* %67 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !19, !noalias !22
  %99 = bitcast double* %69 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1196
  br i1 %100, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv39.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.body76.us ], [ %indvars.iv39.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv43, i64 %indvars.iv39
  %101 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv43, i64 %indvars.iv.next40
  %102 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv43, i64 %indvars.iv39
  %103 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %102, %103
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next44, i64 %indvars.iv39
  %104 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %104
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv43, i64 %indvars.iv39
  %105 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %105
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %101, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond53 = icmp eq i64 %indvars.iv.next40, 1199
  br i1 %exitcond53, label %for.cond73.for.end109_crit_edge.us, label %for.body76.us, !llvm.loop !28

for.cond73.for.end109_crit_edge.us:               ; preds = %for.body76.us
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 999
  br i1 %exitcond46, label %for.end112, label %for.cond73.preheader.us

for.end112:                                       ; preds = %for.cond73.for.end109_crit_edge.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next48, 500
  br i1 %exitcond54, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.end112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv39 = phi i64 [ 0, %entry ], [ %indvars.iv.next40, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv39, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv34 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next35, %if.end.us ]
  %4 = add nsw i64 %indvars.iv34, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv39, i64 %indvars.iv34
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond48, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond49, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.end36_crit_edge.us, %for.end12
  %indvars.iv28 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next29, %for.cond19.for.end36_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv28, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv23 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next24, %if.end28.us ]
  %14 = add nsw i64 %indvars.iv23, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv28, i64 %indvars.iv23
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond46, label %for.cond19.for.end36_crit_edge.us, label %for.body21.us

for.cond19.for.end36_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond47, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.end36_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.end62_crit_edge.us, %for.end39
  %indvars.iv17 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next18, %for.cond45.for.end62_crit_edge.us ]
  %21 = mul nsw i64 %indvars.iv17, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %if.end54.us ]
  %22 = add nsw i64 %indvars.iv, %21
  %23 = trunc i64 %22 to i32
  %rem50.us = srem i32 %23, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.end54.us

if.then52.us:                                     ; preds = %for.body47.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %if.end54.us

if.end54.us:                                      ; preds = %for.body47.us, %if.then52.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond45, label %for.cond45.for.end62_crit_edge.us, label %for.body47.us

for.cond45.for.end62_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.end62_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}
