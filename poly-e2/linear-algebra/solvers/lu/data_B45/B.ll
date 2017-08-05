; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.body.lr.ph, %for.end18.for.body_crit_edge
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = shl i64 %indvars.iv105, 32
  %sext = add i64 %0, 4294967296
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.body3 ], [ 0, %for.body3.lr.ph ]
  %1 = sub nsw i64 0, %indvars.iv91
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv91
  store double %add, double* %arrayidx6, align 8
  %exitcond96 = icmp eq i64 %indvars.iv91, %indvars.iv105
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  br i1 %exitcond96, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %cmp968 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp968, label %for.end18.for.body_crit_edge, label %for.body29.lr.ph.for.body29.us_crit_edge

for.end18.for.body_crit_edge:                     ; preds = %for.end
  %3 = sub i64 1998, %indvars.iv105
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = ashr exact i64 %sext, 32
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %6
  %7 = add nuw nsw i64 %5, 8
  %scevgep103104 = bitcast double* %scevgep103 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep103104, i8 0, i64 %7, i32 8, i1 false)
  %arrayidx22108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22108, align 8
  br label %for.body3.lr.ph

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %8 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %8, align 8
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.end40_crit_edge.us

for.cond30.for.end40_crit_edge.us:                ; preds = %for.cond30.for.end40_crit_edge.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next90.7, %for.cond30.for.end40_crit_edge.us ]
  %10 = mul nuw nsw i64 %indvars.iv89, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %11 = mul nuw nsw i64 %indvars.iv.next90, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %12 = mul nuw nsw i64 %indvars.iv.next90.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %13 = mul nuw nsw i64 %indvars.iv.next90.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.3 = or i64 %indvars.iv89, 4
  %14 = mul nuw nsw i64 %indvars.iv.next90.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = or i64 %indvars.iv89, 5
  %15 = mul nuw nsw i64 %indvars.iv.next90.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.5 = or i64 %indvars.iv89, 6
  %16 = mul nuw nsw i64 %indvars.iv.next90.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.6 = or i64 %indvars.iv89, 7
  %17 = mul nuw nsw i64 %indvars.iv.next90.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond107.7 = icmp eq i64 %indvars.iv.next90.6, 1999
  %indvars.iv.next90.7 = add nsw i64 %indvars.iv89, 8
  br i1 %exitcond107.7, label %for.body47.lr.ph.for.body47.us_crit_edge, label %for.cond30.for.end40_crit_edge.us

for.body47.lr.ph.for.body47.us_crit_edge:         ; preds = %for.cond30.for.end40_crit_edge.us
  br label %for.body47.us.for.body51.us.us_crit_edge

for.body47.us.for.body51.us.us_crit_edge:         ; preds = %for.cond48.for.end74_crit_edge.us, %for.body47.lr.ph.for.body47.us_crit_edge
  %indvars.iv84 = phi i64 [ 0, %for.body47.lr.ph.for.body47.us_crit_edge ], [ %18, %for.cond48.for.end74_crit_edge.us ]
  %scevgep116 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv84
  %18 = add nuw nsw i64 %indvars.iv84, 1
  %scevgep118 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %18
  br label %for.body51.us.us

for.cond48.for.end74_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.us
  %exitcond111 = icmp eq i64 %18, 2000
  br i1 %exitcond111, label %for.body81.lr.ph.for.body81.us_crit_edge, label %for.body47.us.for.body51.us.us_crit_edge

for.body51.us.us:                                 ; preds = %for.cond52.for.end71_crit_edge.us.us, %for.body47.us.for.body51.us.us_crit_edge
  %indvars.iv82 = phi i64 [ 0, %for.body47.us.for.body51.us.us_crit_edge ], [ %19, %for.cond52.for.end71_crit_edge.us.us ]
  %scevgep112 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv82, i64 0
  %19 = add nuw nsw i64 %indvars.iv82, 1
  %scevgep114 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %19, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv84
  %bound0 = icmp ult double* %scevgep112, %scevgep118
  %bound1 = icmp ult double* %scevgep116, %scevgep114
  %found.conflict = and i1 %bound0, %bound1
  %bound0121 = icmp ult double* %scevgep112, %arrayidx59.us.us
  %bound1122 = icmp ult double* %arrayidx59.us.us, %scevgep114
  %found.conflict123 = and i1 %bound0121, %bound1122
  %conflict.rdx = or i1 %found.conflict, %found.conflict123
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %for.body51.us.us
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %20 = or i64 %index, 1
  %21 = or i64 %index, 2
  %22 = or i64 %index, 3
  %23 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv84
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %20, i64 %indvars.iv84
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %21, i64 %indvars.iv84
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %22, i64 %indvars.iv84
  %30 = load double, double* %26, align 8, !alias.scope !4
  %31 = load double, double* %27, align 8, !alias.scope !4
  %32 = load double, double* %28, align 8, !alias.scope !4
  %33 = load double, double* %29, align 8, !alias.scope !4
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = insertelement <2 x double> %34, double %31, i32 1
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = fmul <2 x double> %25, %35
  %39 = fmul <2 x double> %25, %37
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv82, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %44 = fadd <2 x double> %38, %wide.load
  %45 = fadd <2 x double> %39, %wide.load125
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.cond52.for.end71_crit_edge.us.us.loopexit156, label %vector.body, !llvm.loop !9

for.cond52.for.end71_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us.loopexit156: ; preds = %vector.body
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us:             ; preds = %for.cond52.for.end71_crit_edge.us.us.loopexit156, %for.cond52.for.end71_crit_edge.us.us.loopexit
  %exitcond110 = icmp eq i64 %19, 2000
  br i1 %exitcond110, label %for.cond48.for.end74_crit_edge.us, label %for.body51.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv79 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next80.1, %for.body55.us.us ]
  %47 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv84
  %48 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %47, %48
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv82, i64 %indvars.iv79
  %49 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %49
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %50 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80, i64 %indvars.iv84
  %51 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %50, %51
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next80
  %52 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %52
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80, 1999
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond81.1, label %for.cond52.for.end71_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !12

for.body81.lr.ph.for.body81.us_crit_edge:         ; preds = %for.cond48.for.end74_crit_edge.us
  %53 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %54 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.end96_crit_edge.us, %for.body81.lr.ph.for.body81.us_crit_edge
  %indvars.iv77 = phi i64 [ 0, %for.body81.lr.ph.for.body81.us_crit_edge ], [ %55, %for.cond82.for.end96_crit_edge.us ]
  %scevgep131 = getelementptr [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 0
  %55 = add nuw nsw i64 %indvars.iv77, 1
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %54, i64 %55, i64 0
  %scevgep135 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 0
  %scevgep137 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %55, i64 0
  %bound0139 = icmp ult double* %scevgep131, %scevgep137
  %bound1140 = icmp ult double* %scevgep135, %scevgep133
  %memcheck.conflict142 = and i1 %bound0139, %bound1140
  br i1 %memcheck.conflict142, label %for.body85.us.preheader, label %vector.body126.preheader

vector.body126.preheader:                         ; preds = %for.body81.us
  br label %vector.body126

for.body85.us.preheader:                          ; preds = %for.body81.us
  br label %for.body85.us

vector.body126:                                   ; preds = %vector.body126, %vector.body126.preheader
  %index145 = phi i64 [ 0, %vector.body126.preheader ], [ %index.next146.1, %vector.body126 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %index145
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load153 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !13
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load154 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !13
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %index145
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load153, <2 x i64>* %61, align 8, !alias.scope !16, !noalias !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load154, <2 x i64>* %63, align 8, !alias.scope !16, !noalias !13
  %index.next146 = or i64 %index145, 4
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %index.next146
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load153.1 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !13
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load154.1 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !13
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %index.next146
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load153.1, <2 x i64>* %69, align 8, !alias.scope !16, !noalias !13
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load154.1, <2 x i64>* %71, align 8, !alias.scope !16, !noalias !13
  %index.next146.1 = add nsw i64 %index145, 8
  %72 = icmp eq i64 %index.next146.1, 2000
  br i1 %72, label %for.cond82.for.end96_crit_edge.us.loopexit155, label %vector.body126, !llvm.loop !18

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %73 = bitcast double* %arrayidx89.us to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %indvars.iv
  %75 = bitcast double* %arrayidx93.us to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %76 = bitcast double* %arrayidx89.us.1 to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %indvars.iv.next
  %78 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %79 = bitcast double* %arrayidx89.us.2 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %81 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %82 = bitcast double* %arrayidx89.us.3 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %84 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %85 = bitcast double* %arrayidx89.us.4 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %54, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %87 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %86, i64* %87, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.end96_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !19

for.cond82.for.end96_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us.loopexit155:    ; preds = %vector.body126
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.cond82.for.end96_crit_edge.us.loopexit155, %for.cond82.for.end96_crit_edge.us.loopexit
  %exitcond109 = icmp eq i64 %55, 2000
  br i1 %exitcond109, label %for.end99, label %for.body81.us

for.end99:                                        ; preds = %for.cond82.for.end96_crit_edge.us
  %88 = bitcast [2000 x [2000 x double]]* %53 to i8*
  tail call void @free(i8* nonnull %88) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc54, %entry
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc54 ], [ 0, %entry ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.inc54 ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv45, 4294967295
  %cmp27 = icmp sgt i64 %indvars.iv48, 0
  br i1 %cmp27, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.end ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.end ], [ 0, %for.body3.preheader ]
  %1 = and i64 %indvars.iv42, 4294967295
  %cmp55 = icmp sgt i64 %indvars.iv27, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv27
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.body3
  %2 = and i64 %indvars.iv42, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %3 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv27
  %4 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %3, %4
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.preheader, %for.body6.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.preheader ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %5 = icmp eq i64 %1, 0
  br i1 %5, label %for.end.loopexit, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %6 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv
  %7 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv27
  %8 = load double, double* %arrayidx12, align 8
  %mul = fmul double %7, %8
  %sub = fsub double %6, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv27
  %10 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %9, %10
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next, %1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond44.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %11 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %12 = load double, double* %arrayidx20, align 8
  %div = fdiv double %11, %12
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %indvars.iv.next43 = add nuw nsw i64 %1, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next28, %indvars.iv48
  br i1 %exitcond50, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %13 = and i64 %indvars.iv45, 1
  %lcmp.mod53 = icmp eq i64 %13, 0
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 0
  %14 = icmp eq i64 %0, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.end50_crit_edge.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond31.for.end50_crit_edge.us ], [ %indvars.iv48, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv38
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod53, label %for.body33.us.prol.preheader, label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.preheader:                     ; preds = %for.body30.us
  br label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.body33.us.prol.preheader
  %15 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv38
  %16 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %15, %16
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.body30.us, %for.body33.us.prol
  %indvars.iv30.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.body30.us ]
  %.unr54.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre24, %for.body30.us ]
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond31.for.end50_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body30.us.new
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr.ph, %for.body30.us.new ], [ %indvars.iv.next31.1, %for.body33.us ]
  %17 = phi double [ %.unr54.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv30
  %18 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv38
  %19 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %18, %19
  %sub47.us = fsub double %17, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv.next31
  %20 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next31, i64 %indvars.iv38
  %21 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %20, %21
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next31, %0
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond.1, label %for.cond31.for.end50_crit_edge.us.unr-lcssa, label %for.body33.us

for.cond31.for.end50_crit_edge.us.unr-lcssa:      ; preds = %for.body33.us
  br label %for.cond31.for.end50_crit_edge.us

for.cond31.for.end50_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit, %for.cond31.for.end50_crit_edge.us.unr-lcssa
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond47, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.end50_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.body
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %indvars.iv.next46 = add nuw nsw i64 %0, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond51, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv9, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond12, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
