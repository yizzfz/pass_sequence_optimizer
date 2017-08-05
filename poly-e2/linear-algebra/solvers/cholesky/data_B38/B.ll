; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %entry, %for.end18.for.body_crit_edge
  %indvars.iv30 = phi i64 [ %0, %for.end18.for.body_crit_edge ], [ 0, %entry ]
  %0 = add nuw nsw i64 %indvars.iv30, 1
  %sext = shl i64 %0, 32
  %1 = ashr exact i64 %sext, 32
  %2 = sub i64 1998, %indvars.iv30
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv16 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next17, %for.body3 ]
  %5 = sub nsw i64 0, %indvars.iv16
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv16
  store double %add, double* %arrayidx6, align 8
  %exitcond21 = icmp eq i64 %indvars.iv16, %indvars.iv30
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond21, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %scevgep28 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %1
  %7 = add nuw nsw i64 %4, 8
  %cmp945 = icmp slt i64 %0, 2000
  br i1 %cmp945, label %for.end18.for.body_crit_edge, label %for.end25.for.body29.us_crit_edge

for.end18.for.body_crit_edge:                     ; preds = %for.end
  %8 = bitcast double* %scevgep28 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 %7, i32 8, i1 false)
  %arrayidx2232 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv30
  store double 1.000000e+00, double* %arrayidx2232, align 8
  br label %for.body3.lr.ph

for.end25.for.body29.us_crit_edge:                ; preds = %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv30
  store double 1.000000e+00, double* %arrayidx22, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.end25.for.body29.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %for.end25.for.body29.us_crit_edge ], [ %indvars.iv.next15.7, %for.body29.us ]
  %9 = mul nuw nsw i64 %indvars.iv14, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %10 = mul nuw nsw i64 %indvars.iv.next15, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %11 = mul nuw nsw i64 %indvars.iv.next15.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.2 = or i64 %indvars.iv14, 3
  %12 = mul nuw nsw i64 %indvars.iv.next15.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.3 = or i64 %indvars.iv14, 4
  %13 = mul nuw nsw i64 %indvars.iv.next15.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.4 = or i64 %indvars.iv14, 5
  %14 = mul nuw nsw i64 %indvars.iv.next15.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.5 = or i64 %indvars.iv14, 6
  %15 = mul nuw nsw i64 %indvars.iv.next15.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.6 = or i64 %indvars.iv14, 7
  %16 = mul nuw nsw i64 %indvars.iv.next15.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next15.7 = add nuw nsw i64 %indvars.iv14, 8
  %cmp27.us.7 = icmp slt i64 %indvars.iv.next15.7, 2000
  br i1 %cmp27.us.7, label %for.body29.us, label %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader

for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader: ; preds = %for.body29.us
  br label %for.cond48.preheader.us.for.body51.us.us_crit_edge

for.cond48.preheader.us.for.body51.us.us_crit_edge: ; preds = %for.cond48.for.end74_crit_edge.us, %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader ], [ %17, %for.cond48.for.end74_crit_edge.us ]
  %scevgep35 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv9
  %17 = add i64 %indvars.iv9, 1
  %scevgep37 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %17
  br label %vector.memcheck

for.cond48.for.end74_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.us
  %cmp45.us = icmp slt i64 %17, 2000
  br i1 %cmp45.us, label %for.cond48.preheader.us.for.body51.us.us_crit_edge, label %vector.memcheck60.preheader

vector.memcheck60.preheader:                      ; preds = %for.cond48.for.end74_crit_edge.us
  br label %vector.memcheck60

vector.memcheck:                                  ; preds = %for.cond52.for.end71_crit_edge.us.us, %for.cond48.preheader.us.for.body51.us.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %for.cond48.preheader.us.for.body51.us.us_crit_edge ], [ %indvars.iv.next8, %for.cond52.for.end71_crit_edge.us.us ]
  %18 = bitcast double* %scevgep35 to i8*
  %19 = bitcast double* %scevgep37 to i8*
  %20 = mul i64 %indvars.iv7, 16000
  %scevgep33 = getelementptr i8, i8* %call, i64 %20
  %21 = add i64 %20, 16000
  %scevgep34 = getelementptr i8, i8* %call, i64 %21
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv9
  %bound0 = icmp ult i8* %scevgep33, %19
  %bound1 = icmp ult i8* %18, %scevgep34
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound040 = icmp ult i8* %scevgep33, %bc
  %bound141 = icmp ult i8* %bc, %scevgep34
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx = or i1 %found.conflict, %found.conflict42
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %vector.memcheck
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv9
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %23, i64 %indvars.iv9
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %24, i64 %indvars.iv9
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %25, i64 %indvars.iv9
  %33 = load double, double* %29, align 8, !alias.scope !4
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %36, i32 1
  %41 = fmul <2 x double> %28, %38
  %42 = fmul <2 x double> %28, %40
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv7, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %47 = fadd <2 x double> %wide.load, %41
  %48 = fadd <2 x double> %wide.load44, %42
  store <2 x double> %47, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %48, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %for.cond52.for.end71_crit_edge.us.us.loopexit75, label %vector.body, !llvm.loop !9

for.cond52.for.end71_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us.loopexit75:  ; preds = %vector.body
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us:             ; preds = %for.cond52.for.end71_crit_edge.us.us.loopexit75, %for.cond52.for.end71_crit_edge.us.us.loopexit
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next8, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.cond48.for.end74_crit_edge.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv4 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next5.1, %for.body55.us.us ]
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv9
  %52 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %51, %52
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv7, i64 %indvars.iv4
  %53 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %53, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %54 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next5, i64 %indvars.iv9
  %55 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %54, %55
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next5
  %56 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %56, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5, 1999
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  br i1 %exitcond6.1, label %for.cond52.for.end71_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !12

vector.memcheck60:                                ; preds = %for.cond82.for.end96_crit_edge.us, %vector.memcheck60.preheader
  %indvars.iv2 = phi i64 [ 0, %vector.memcheck60.preheader ], [ %57, %for.cond82.for.end96_crit_edge.us ]
  %scevgep50 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %57 = add i64 %indvars.iv2, 1
  %scevgep52 = getelementptr [2000 x double], [2000 x double]* %A, i64 %57, i64 0
  %58 = mul i64 %indvars.iv2, 16000
  %scevgep54 = getelementptr i8, i8* %call, i64 %58
  %59 = add i64 %58, 16000
  %scevgep55 = getelementptr i8, i8* %call, i64 %59
  %60 = bitcast double* %scevgep52 to i8*
  %61 = bitcast double* %scevgep50 to i8*
  %bound056 = icmp ult i8* %61, %scevgep55
  %bound157 = icmp ult i8* %scevgep54, %60
  %memcheck.conflict59 = and i1 %bound056, %bound157
  br i1 %memcheck.conflict59, label %for.body85.us.preheader, label %vector.body45.preheader

vector.body45.preheader:                          ; preds = %vector.memcheck60
  br label %vector.body45

for.body85.us.preheader:                          ; preds = %vector.memcheck60
  br label %for.body85.us

vector.body45:                                    ; preds = %vector.body45, %vector.body45.preheader
  %index62 = phi i64 [ 0, %vector.body45.preheader ], [ %index.next63.1, %vector.body45 ]
  %62 = bitcast i8* %call to [2000 x [2000 x double]]*
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv2, i64 %index62
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load70 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load71 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %index62
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load70, <2 x i64>* %68, align 8, !alias.scope !16, !noalias !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load71, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %index.next63 = or i64 %index62, 4
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv2, i64 %index.next63
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load70.1 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load71.1 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %index.next63
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load70.1, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load71.1, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next63.1 = add nuw nsw i64 %index62, 8
  %79 = icmp eq i64 %index.next63.1, 2000
  br i1 %79, label %for.cond82.for.end96_crit_edge.us.loopexit74, label %vector.body45, !llvm.loop !18

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %80 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv2, i64 %indvars.iv
  %81 = bitcast double* %arrayidx89.us to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  %83 = bitcast double* %arrayidx93.us to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx89.us.1 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next
  %86 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx89.us.2 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next.1
  %89 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx89.us.3 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next.2
  %92 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %91, i64* %92, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx89.us.4 to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next.3
  %95 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %94, i64* %95, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.end96_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !19

for.cond82.for.end96_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us.loopexit74:     ; preds = %vector.body45
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.cond82.for.end96_crit_edge.us.loopexit74, %for.cond82.for.end96_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %57, 2000
  br i1 %cmp79.us, label %vector.memcheck60, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.end96_crit_edge.us
  call void @free(i8* nonnull %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.end47.for.body_crit_edge, %entry
  %indvars.iv19 = phi i2 [ %indvars.iv.next20, %for.end47.for.body_crit_edge ], [ 0, %entry ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.end47.for.body_crit_edge ], [ 0, %entry ]
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %for.end47.for.body_crit_edge ], [ -1, %entry ]
  %0 = zext i2 %indvars.iv19 to i64
  %1 = add i64 %indvars.iv11, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp22 = icmp sgt i64 %indvars.iv11, 0
  br i1 %cmp22, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.end47_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.end47_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv11
  %.pre15 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv11
  %.pre14 = load double, double* %arrayidx43, align 8
  %wide.trip.count9 = zext i32 %indvars.iv7 to i64
  %xtraiter16 = and i64 %indvars.iv11, 3
  %lcmp.mod17 = icmp eq i64 %xtraiter16, 0
  br i1 %lcmp.mod17, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %3 = phi double [ %.pre14, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv5.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next6.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter16, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv5.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv5.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !20

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %.unr18 = phi double [ %.pre14, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv5.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %0, %for.body30.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %2, 3
  br i1 %5, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next4, %for.end ]
  %indvars.iv1 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next2, %for.end ]
  %6 = add i64 %indvars.iv3, 4294967295
  %7 = and i64 %6, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv3, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv3
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %wide.trip.count = zext i32 %indvars.iv1 to i64
  %8 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3, i64 0
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %12 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv3
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %cmp2 = icmp slt i64 %indvars.iv.next4, %indvars.iv11
  %indvars.iv.next2 = add nsw i32 %indvars.iv1, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.body30.lr.ph

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %19 = phi double [ %.unr18, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv5 = phi i64 [ %indvars.iv5.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next6.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv5
  %20 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %20, %20
  %sub44 = fsub double %19, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv.next6
  %21 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %21, %21
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv.next6.1
  %22 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %22, %22
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv5, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv.next6.2
  %23 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %23, %23
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond10.3 = icmp eq i64 %indvars.iv.next6.2, %wide.trip.count9
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv5, 4
  br i1 %exitcond10.3, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit, %for.cond28.preheader.for.end47_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.cond28.preheader.for.end47_crit_edge ], [ %arrayidx43, %for.body30.prol.loopexit ], [ %arrayidx43, %for.end47.loopexit ]
  %24 = phi double [ %.pre15, %for.cond28.preheader.for.end47_crit_edge ], [ %sub44.lcssa.unr, %for.body30.prol.loopexit ], [ %sub44.3, %for.end47.loopexit ]
  %call = call double @sqrt(double %24) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %cmp = icmp slt i64 %indvars.iv.next12, 2000
  %indvars.iv.next8 = add nsw i32 %indvars.iv7, 1
  br i1 %cmp, label %for.end47.for.body_crit_edge, label %for.end58

for.end47.for.body_crit_edge:                     ; preds = %for.end47
  %indvars.iv.next20 = add i2 %indvars.iv19, 1
  br label %for.body

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.end, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nsw i64 %indvars.iv2, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv2
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.end

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %cmp = icmp slt i64 %indvars.iv.next3, 2000
  br i1 %cmp, label %for.body4.lr.ph, label %for.end12

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
