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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.end18.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv.next77 = add i64 %indvars.iv76, 1
  %sext = shl i64 %indvars.iv.next77, 32
  %0 = ashr exact i64 %sext, 32
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %0
  %1 = sub i64 1998, %indvars.iv76
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  %4 = add nuw nsw i64 %3, 8
  %cmp228 = icmp sgt i64 %indvars.iv76, -1
  br i1 %cmp228, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.body
  %wide.trip.count63 = zext i32 %indvars.iv61 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv58 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next59, %for.body3 ]
  %5 = sub nsw i64 0, %indvars.iv58
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv58
  store double %add, double* %arrayidx6, align 8
  %exitcond64 = icmp eq i64 %indvars.iv58, %wide.trip.count63
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  br i1 %exitcond64, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %cmp930 = icmp slt i64 %indvars.iv.next77, 2000
  br i1 %cmp930, label %for.end18.for.body_crit_edge, label %for.body29.lr.ph.for.body29.us_crit_edge

for.end18.for.body_crit_edge:                     ; preds = %for.end
  %7 = bitcast double* %scevgep74 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %4, i32 8, i1 false)
  %arrayidx2281 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %arrayidx2281, align 8
  %indvars.iv.next62 = add i32 %indvars.iv61, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx2283 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %arrayidx2283, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.cond30.for.end40_crit_edge.us

for.cond30.for.end40_crit_edge.us:                ; preds = %for.cond30.for.end40_crit_edge.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv55 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next56.4, %for.cond30.for.end40_crit_edge.us ]
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv55, i64 0
  %scevgep54 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv55, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next, i64 0
  %scevgep54.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv55, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.1, i64 0
  %scevgep54.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv55, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.2, i64 0
  %scevgep54.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv55, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvar.next.3, i64 0
  %scevgep54.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next56.4 = add nuw nsw i64 %indvars.iv55, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next56.4, 2000
  br i1 %cmp27.us.4, label %for.cond30.for.end40_crit_edge.us, label %for.body51.lr.ph.for.body51.us_crit_edge.preheader

for.body51.lr.ph.for.body51.us_crit_edge.preheader: ; preds = %for.cond30.for.end40_crit_edge.us
  br label %for.body51.lr.ph.for.body51.us_crit_edge

for.body51.lr.ph.for.body51.us_crit_edge:         ; preds = %for.inc75, %for.body51.lr.ph.for.body51.us_crit_edge.preheader
  %indvars.iv48 = phi i64 [ 0, %for.body51.lr.ph.for.body51.us_crit_edge.preheader ], [ %9, %for.inc75 ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %9 = add i64 %indvars.iv48, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %9
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.end71_crit_edge.us, %for.body51.lr.ph.for.body51.us_crit_edge
  %indvars.iv46 = phi i64 [ 0, %for.body51.lr.ph.for.body51.us_crit_edge ], [ %indvars.iv.next47, %for.cond52.for.end71_crit_edge.us ]
  %10 = bitcast double* %scevgep3 to i8*
  %11 = bitcast double* %scevgep5 to i8*
  %12 = mul i64 %indvars.iv46, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %12
  %13 = add i64 %12, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %13
  %arrayidx59.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv48
  %bound0 = icmp ult i8* %scevgep1, %11
  %bound1 = icmp ult i8* %10, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.body55.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.preheader:                          ; preds = %vector.memcheck
  br label %for.body55.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = or i64 %index, 1
  %16 = or i64 %index, 2
  %17 = or i64 %index, 3
  %18 = load double, double* %arrayidx59.us, align 8, !alias.scope !1
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv48
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %15, i64 %indvars.iv48
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %16, i64 %indvars.iv48
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %17, i64 %indvars.iv48
  %25 = load double, double* %21, align 8, !alias.scope !4
  %26 = load double, double* %22, align 8, !alias.scope !4
  %27 = load double, double* %23, align 8, !alias.scope !4
  %28 = load double, double* %24, align 8, !alias.scope !4
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %26, i32 1
  %31 = insertelement <2 x double> undef, double %27, i32 0
  %32 = insertelement <2 x double> %31, double %28, i32 1
  %33 = fmul <2 x double> %20, %30
  %34 = fmul <2 x double> %20, %32
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv46, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %39 = fadd <2 x double> %33, %wide.load
  %40 = fadd <2 x double> %34, %wide.load12
  store <2 x double> %39, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %40, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %41 = icmp eq i64 %index.next, 2000
  br i1 %41, label %for.cond52.for.end71_crit_edge.us.loopexit45, label %vector.body, !llvm.loop !9

for.body55.us:                                    ; preds = %for.body55.us, %for.body55.us.preheader
  %indvars.iv42 = phi i64 [ 0, %for.body55.us.preheader ], [ %indvars.iv.next43.1, %for.body55.us ]
  %42 = bitcast i8* %call to [2000 x [2000 x double]]*
  %43 = load double, double* %arrayidx59.us, align 8
  %arrayidx63.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv48
  %44 = load double, double* %arrayidx63.us, align 8
  %mul.us = fmul double %43, %44
  %arrayidx67.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv46, i64 %indvars.iv42
  %45 = load double, double* %arrayidx67.us, align 8
  %add68.us = fadd double %mul.us, %45
  store double %add68.us, double* %arrayidx67.us, align 8
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %46 = load double, double* %arrayidx59.us, align 8
  %arrayidx63.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next43, i64 %indvars.iv48
  %47 = load double, double* %arrayidx63.us.1, align 8
  %mul.us.1 = fmul double %46, %47
  %arrayidx67.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next43
  %48 = load double, double* %arrayidx67.us.1, align 8
  %add68.us.1 = fadd double %mul.us.1, %48
  store double %add68.us.1, double* %arrayidx67.us.1, align 8
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv42, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next43, 1999
  br i1 %exitcond45.1, label %for.cond52.for.end71_crit_edge.us.loopexit, label %for.body55.us, !llvm.loop !12

for.cond52.for.end71_crit_edge.us.loopexit:       ; preds = %for.body55.us
  br label %for.cond52.for.end71_crit_edge.us

for.cond52.for.end71_crit_edge.us.loopexit45:     ; preds = %vector.body
  br label %for.cond52.for.end71_crit_edge.us

for.cond52.for.end71_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.loopexit45, %for.cond52.for.end71_crit_edge.us.loopexit
  %indvars.iv.next47 = add nuw i64 %indvars.iv46, 1
  %cmp49.us = icmp slt i64 %indvars.iv.next47, 2000
  br i1 %cmp49.us, label %vector.memcheck, label %for.inc75

for.inc75:                                        ; preds = %for.cond52.for.end71_crit_edge.us
  %cmp45 = icmp slt i64 %9, 2000
  br i1 %cmp45, label %for.body51.lr.ph.for.body51.us_crit_edge, label %vector.memcheck30.preheader

vector.memcheck30.preheader:                      ; preds = %for.inc75
  br label %vector.memcheck30

vector.memcheck30:                                ; preds = %for.cond82.for.end96_crit_edge.us, %vector.memcheck30.preheader
  %indvars.iv39 = phi i64 [ 0, %vector.memcheck30.preheader ], [ %50, %for.cond82.for.end96_crit_edge.us ]
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  %50 = add i64 %indvars.iv39, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %50, i64 0
  %scevgep22 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv39, i64 0
  %scevgep24 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %50, i64 0
  %bound026 = icmp ult double* %scevgep18, %scevgep24
  %bound127 = icmp ult double* %scevgep22, %scevgep20
  %memcheck.conflict29 = and i1 %bound026, %bound127
  br i1 %memcheck.conflict29, label %for.body85.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck30
  br label %vector.body13

for.body85.us.preheader:                          ; preds = %vector.memcheck30
  br label %for.body85.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index32 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next33.1, %vector.body13 ]
  %51 = bitcast i8* %call to [2000 x [2000 x double]]*
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv39, i64 %index32
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !13
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load41 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !13
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %index32
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load40, <2 x i64>* %57, align 8, !alias.scope !16, !noalias !13
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load41, <2 x i64>* %59, align 8, !alias.scope !16, !noalias !13
  %index.next33 = or i64 %index32, 4
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv39, i64 %index.next33
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load41.1 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !13
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %index.next33
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load40.1, <2 x i64>* %65, align 8, !alias.scope !16, !noalias !13
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load41.1, <2 x i64>* %67, align 8, !alias.scope !16, !noalias !13
  %index.next33.1 = add nuw nsw i64 %index32, 8
  %68 = icmp eq i64 %index.next33.1, 2000
  br i1 %68, label %for.cond82.for.end96_crit_edge.us.loopexit44, label %vector.body13, !llvm.loop !18

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %69 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv39, i64 %indvars.iv
  %70 = bitcast double* %arrayidx89.us to i64*
  %71 = load i64, i64* %70, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %72 = bitcast double* %arrayidx93.us to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv39, i64 %indvars.iv.next
  %73 = bitcast double* %arrayidx89.us.1 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %75 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %76 = bitcast double* %arrayidx89.us.2 to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %78 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %79 = bitcast double* %arrayidx89.us.3 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %81 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv39, i64 %indvars.iv.next.3
  %82 = bitcast double* %arrayidx89.us.4 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next.3
  %84 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %for.cond82.for.end96_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !19

for.cond82.for.end96_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us.loopexit44:     ; preds = %vector.body13
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.cond82.for.end96_crit_edge.us.loopexit44, %for.cond82.for.end96_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %50, 2000
  br i1 %cmp79.us, label %vector.memcheck30, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.end96_crit_edge.us
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.end47.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv4 = phi i2 [ %indvars.iv.next5, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv19 = phi i32 [ %indvars.iv.next20, %for.end47.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %0 = zext i2 %indvars.iv4 to i64
  %1 = add i64 %indvars.iv23, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv23, 0
  br i1 %cmp23, label %for.body3.preheader, label %for.end27.for.end47_crit_edge

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv15 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next16, %for.end ]
  %indvars.iv13 = phi i32 [ -1, %for.body3.preheader ], [ %indvars.iv.next14, %for.end ]
  %3 = add i64 %indvars.iv15, 4294967295
  %4 = and i64 %3, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv15, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv15
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.body3
  %wide.trip.count = zext i32 %indvars.iv13 to i64
  %5 = and i64 %3, 1
  %lcmp.mod = icmp eq i64 %5, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %6 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %7 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %6, %7
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %8 = icmp eq i64 %4, 0
  br i1 %8, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %9 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %10 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %11 = load double, double* %arrayidx12, align 8
  %mul = fmul double %10, %11
  %sub = fsub double %9, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %12, %13
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit.unr-lcssa, %for.body3
  %14 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv15
  %15 = load double, double* %arrayidx20, align 8
  %div = fdiv double %14, %15
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next16 = add nuw i64 %indvars.iv15, 1
  %cmp2 = icmp slt i64 %indvars.iv.next16, %indvars.iv23
  %indvars.iv.next14 = add nsw i32 %indvars.iv13, 1
  br i1 %cmp2, label %for.body3, label %for.body30.lr.ph

for.end27.for.end47_crit_edge:                    ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  %.pre27 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  %.pre26 = load double, double* %arrayidx43, align 8
  %wide.trip.count21 = zext i32 %indvars.iv19 to i64
  %xtraiter1 = and i64 %indvars.iv23, 3
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %16 = phi double [ %.pre26, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv17.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next18.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter1, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv17.prol
  %17 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %17, %17
  %sub44.prol = fsub double %16, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next18.prol = add nuw nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !20

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %.unr3 = phi double [ %.pre26, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv17.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %0, %for.body30.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %2, 3
  br i1 %18, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %19 = phi double [ %.unr3, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next18.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv17
  %20 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %20, %20
  %sub44 = fsub double %19, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18
  %21 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %21, %21
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18.1
  %22 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %22, %22
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next18.2
  %23 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %23, %23
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %indvars.iv.next18.3 = add nsw i64 %indvars.iv17, 4
  %exitcond22.3 = icmp eq i64 %indvars.iv.next18.2, %wide.trip.count21
  br i1 %exitcond22.3, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit, %for.end27.for.end47_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.end27.for.end47_crit_edge ], [ %arrayidx43, %for.body30.prol.loopexit ], [ %arrayidx43, %for.end47.loopexit ]
  %24 = phi double [ %.pre27, %for.end27.for.end47_crit_edge ], [ %sub44.lcssa.unr, %for.body30.prol.loopexit ], [ %sub44.3, %for.end47.loopexit ]
  %call = tail call double @sqrt(double %24) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next24 = add i64 %indvars.iv23, 1
  %cmp = icmp slt i64 %indvars.iv.next24, 2000
  %indvars.iv.next20 = add i32 %indvars.iv19, 1
  br i1 %cmp, label %for.end47.for.body_crit_edge, label %for.end58

for.end47.for.body_crit_edge:                     ; preds = %for.end47
  %indvars.iv.next5 = add i2 %indvars.iv4, 1
  br label %for.body

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.lr.ph, label %for.inc10

for.body4.lr.ph:                                  ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %3, %indvars.iv
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
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10.loopexit

for.inc10.loopexit:                               ; preds = %if.end
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.body
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
