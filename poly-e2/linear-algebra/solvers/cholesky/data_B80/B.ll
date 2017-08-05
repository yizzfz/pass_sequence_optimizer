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
  %.cast = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %.cast)
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
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.end18.for.body_crit_edge, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %5, %for.end18.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.end18.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv110 = phi i32 [ %indvars.iv.next111, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv114, 32
  %1 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv120, -1
  br i1 %cmp257, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.body
  %wide.trip.count112 = zext i32 %indvars.iv110 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.body3.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %2 = sub nsw i64 0, %indvars.iv107
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv120, i64 %indvars.iv107
  store double %add, double* %arrayidx6, align 8
  %exitcond113 = icmp eq i64 %indvars.iv107, %wide.trip.count112
  br i1 %exitcond113, label %for.body3.for.end_crit_edge, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  br label %for.body3

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.body3.for.end_crit_edge
  %4 = phi [2000 x double]* [ %.pre, %for.body3.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next121 = add i64 %indvars.iv120, 1
  %cmp959 = icmp slt i64 %indvars.iv.next121, 2000
  br i1 %cmp959, label %for.body11.lr.ph, label %for.body29.lr.ph.for.body33.lr.ph.us_crit_edge

for.body11.lr.ph:                                 ; preds = %for.end
  %5 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body11

for.body11:                                       ; preds = %for.body11.for.body11_crit_edge, %for.body11.lr.ph
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.body11.for.body11_crit_edge ], [ %1, %for.body11.lr.ph ]
  %6 = phi [2000 x double]* [ %5, %for.body11.for.body11_crit_edge ], [ %4, %for.body11.lr.ph ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv120, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond119 = icmp eq i64 %indvars.iv116, 1999
  br i1 %exitcond119, label %for.end18.for.body_crit_edge, label %for.body11.for.body11_crit_edge

for.body11.for.body11_crit_edge:                  ; preds = %for.body11
  %indvars.iv.next117 = add nsw i64 %indvars.iv116, 1
  br label %for.body11

for.end18.for.body_crit_edge:                     ; preds = %for.body11
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv120, i64 %indvars.iv120
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next111 = add i32 %indvars.iv110, 1
  %indvars.iv.next115 = add nsw i64 %1, 1
  br label %for.body

for.body29.lr.ph.for.body33.lr.ph.us_crit_edge:   ; preds = %for.end
  %arrayidx22126 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv120, i64 %indvars.iv120
  store double 1.000000e+00, double* %arrayidx22126, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body33.lr.ph.us

for.body33.lr.ph.us:                              ; preds = %for.body33.lr.ph.us, %for.body29.lr.ph.for.body33.lr.ph.us_crit_edge
  %indvars.iv104 = phi i64 [ 0, %for.body29.lr.ph.for.body33.lr.ph.us_crit_edge ], [ %indvars.iv.next105, %for.body33.lr.ph.us ]
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv104, i64 0
  %scevgep103 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep103, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond183 = icmp ne i64 %indvars.iv104, 1999
  br i1 %exitcond183, label %for.body33.lr.ph.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body33.lr.ph.us
  %8 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.split.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %cmp45.us = icmp slt i64 %47, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.split.us.us, label %vector.memcheck168.preheader

vector.memcheck168.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck168

for.inc72.us.us.loopexit:                         ; preds = %for.body55.us.us
  br label %for.inc72.us.us

for.inc72.us.us.loopexit185:                      ; preds = %vector.body
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit185, %for.inc72.us.us.loopexit
  %indvars.iv.next95 = add i64 %indvars.iv94, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next95, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

vector.memcheck:                                  ; preds = %for.inc72.us.us, %for.body51.lr.ph.split.us.us
  %indvars.iv94 = phi i64 [ 0, %for.body51.lr.ph.split.us.us ], [ %indvars.iv.next95, %for.inc72.us.us ]
  %9 = bitcast double* %scevgep141 to i8*
  %10 = bitcast double* %scevgep143 to i8*
  %11 = mul i64 %indvars.iv94, 16000
  %scevgep139 = getelementptr i8, i8* %call, i64 %11
  %12 = add i64 %11, 16000
  %scevgep140 = getelementptr i8, i8* %call, i64 %12
  %arrayidx57.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv94
  %sunkaddr71 = ptrtoint [2000 x double]* %arrayidx57.us.us to i64
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %bc = inttoptr i64 %sunkaddr73 to i8*
  %bound0 = icmp ult i8* %scevgep139, %bc
  %bound1 = icmp ult i8* %bc, %scevgep140
  %found.conflict = and i1 %bound0, %bound1
  %bound0146 = icmp ult i8* %scevgep139, %10
  %bound1147 = icmp ult i8* %9, %scevgep140
  %found.conflict148 = and i1 %bound0146, %bound1147
  %conflict.rdx = or i1 %found.conflict, %found.conflict148
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %vector.memcheck
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %13 = inttoptr i64 %sunkaddr73 to double*
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = or i64 %index, 1
  %16 = or i64 %index, 2
  %17 = or i64 %index, 3
  %18 = load double, double* %13, align 8, !alias.scope !1
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %index, i64 %indvars.iv96
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %15, i64 %indvars.iv96
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %16, i64 %indvars.iv96
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %17, i64 %indvars.iv96
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
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv94, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %39 = fadd <2 x double> %wide.load, %33
  %40 = fadd <2 x double> %wide.load150, %34
  store <2 x double> %39, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %40, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %41 = icmp eq i64 %index.next, 2000
  br i1 %41, label %for.inc72.us.us.loopexit185, label %vector.body, !llvm.loop !9

for.body55.us.us:                                 ; preds = %for.body55.us.us.preheader, %for.body55.us.us.for.body55.us.us_crit_edge
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.body55.us.us.for.body55.us.us_crit_edge ], [ 0, %for.body55.us.us.preheader ]
  %42 = inttoptr i64 %sunkaddr73 to double*
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %44 = load double, double* %42, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv90, i64 %indvars.iv96
  %45 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %44, %45
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv94, i64 %indvars.iv90
  %46 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %46, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %exitcond93 = icmp eq i64 %indvars.iv90, 1999
  br i1 %exitcond93, label %for.inc72.us.us.loopexit, label %for.body55.us.us.for.body55.us.us_crit_edge, !llvm.loop !12

for.body55.us.us.for.body55.us.us_crit_edge:      ; preds = %for.body55.us.us
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br label %for.body55.us.us

for.body51.lr.ph.split.us.us:                     ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv96 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %47, %for.inc75.us ]
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %8, i64 0, i64 %indvars.iv96
  %47 = add i64 %indvars.iv96, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %8, i64 1999, i64 %47
  %sunkaddr72 = shl nsw i64 %indvars.iv96, 3
  br label %vector.memcheck

for.inc97.us.loopexit:                            ; preds = %for.body85.us
  br label %for.inc97.us

for.inc97.us.loopexit184:                         ; preds = %vector.body151
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit184, %for.inc97.us.loopexit
  %cmp79.us = icmp slt i64 %53, 2000
  br i1 %cmp79.us, label %vector.memcheck168, label %for.end99

for.body85.us:                                    ; preds = %for.body85.us.preheader, %for.body85.us.for.body85.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body85.us.for.body85.us_crit_edge ], [ 0, %for.body85.us.preheader ]
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv88, i64 %indvars.iv
  %49 = bitcast double* %arrayidx89.us to i64*
  %50 = load i64, i64* %49, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv88, i64 %indvars.iv
  %51 = bitcast double* %arrayidx93.us to i64*
  store i64 %50, i64* %51, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %for.inc97.us.loopexit, label %for.body85.us.for.body85.us_crit_edge, !llvm.loop !13

for.body85.us.for.body85.us_crit_edge:            ; preds = %for.body85.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body85.us

vector.memcheck168:                               ; preds = %for.inc97.us, %vector.memcheck168.preheader
  %indvars.iv88 = phi i64 [ 0, %vector.memcheck168.preheader ], [ %53, %for.inc97.us ]
  %52 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %8, i64 %indvars.iv88, i64 0
  %53 = add i64 %indvars.iv88, 1
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %8, i64 %53, i64 0
  %scevgep160 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv88, i64 0
  %scevgep162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %53, i64 0
  %bound0164 = icmp ult double* %scevgep156, %scevgep162
  %bound1165 = icmp ult double* %scevgep160, %scevgep158
  %memcheck.conflict167 = and i1 %bound0164, %bound1165
  br i1 %memcheck.conflict167, label %for.body85.us.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %vector.memcheck168
  br label %vector.body151

for.body85.us.preheader:                          ; preds = %vector.memcheck168
  br label %for.body85.us

vector.body151:                                   ; preds = %vector.body151, %vector.body151.preheader
  %index170 = phi i64 [ 0, %vector.body151.preheader ], [ %index.next171.1, %vector.body151 ]
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv88, i64 %index170
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !14
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !14
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv88, i64 %index170
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %60, align 8, !alias.scope !17, !noalias !14
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %62, align 8, !alias.scope !17, !noalias !14
  %index.next171 = or i64 %index170, 4
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv88, i64 %index.next171
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !14
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !14
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv88, i64 %index.next171
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %68, align 8, !alias.scope !17, !noalias !14
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %70, align 8, !alias.scope !17, !noalias !14
  %index.next171.1 = add nuw nsw i64 %index170, 8
  %71 = icmp eq i64 %index.next171.1, 2000
  br i1 %71, label %for.inc97.us.loopexit184, label %vector.body151, !llvm.loop !19

for.end99:                                        ; preds = %for.inc97.us
  call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.end47.for.body_crit_edge, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %11, %for.end47.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv31 = phi i32 [ %indvars.iv.next32, %for.end47.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %cmp23 = icmp sgt i64 %indvars.iv35, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.end47

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.body30.preheader:                             ; preds = %for.end
  %.pre37 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx328 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv35
  %sunkaddr21 = ptrtoint [2000 x double]* %arrayidx328 to i64
  %sunkaddr22 = shl i64 %indvars.iv35, 3
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  %wide.trip.count33 = zext i32 %indvars.iv31 to i64
  %.pre41 = load double, double* %sunkaddr24, align 8
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end.for.cond4.preheader_crit_edge
  %1 = phi [2000 x double]* [ %5, %for.end.for.cond4.preheader_crit_edge ], [ %0, %for.cond4.preheader.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.end.for.cond4.preheader_crit_edge ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv25 = phi i32 [ %indvars.iv.next26, %for.end.for.cond4.preheader_crit_edge ], [ -1, %for.cond4.preheader.preheader ]
  %cmp51 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv35
  %sunkaddr = ptrtoint [2000 x double]* %arrayidx14 to i64
  %sunkaddr18 = shl i64 %indvars.iv27, 3
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  %wide.trip.count = zext i32 %indvars.iv25 to i64
  %.pre40 = load double, double* %sunkaddr20, align 8
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.lr.ph
  %2 = phi double [ %sub, %for.body6.for.body6_crit_edge ], [ %.pre40, %for.body6.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.for.body6_crit_edge ], [ 0, %for.body6.lr.ph ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv35, i64 %indvars.iv
  %3 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv
  %4 = load double, double* %arrayidx12, align 8
  %mul = fmul double %3, %4
  %sub = fsub double %2, %mul
  %sunkaddr50 = ptrtoint [2000 x double]* %arrayidx14 to i64
  %sunkaddr51 = mul i64 %indvars.iv27, 8
  %sunkaddr52 = add i64 %sunkaddr50, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  store double %sub, double* %sunkaddr53, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.body6.for.end_crit_edge, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6

for.body6.for.end_crit_edge:                      ; preds = %for.body6
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.cond4.preheader, %for.body6.for.end_crit_edge
  %5 = phi [2000 x double]* [ %.pre, %for.body6.for.end_crit_edge ], [ %1, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv27
  %6 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv27
  %7 = load double, double* %arrayidx24, align 8
  %div = fdiv double %7, %6
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next28 = add nuw i64 %indvars.iv27, 1
  %cmp2 = icmp slt i64 %indvars.iv.next28, %indvars.iv35
  br i1 %cmp2, label %for.end.for.cond4.preheader_crit_edge, label %for.body30.preheader

for.end.for.cond4.preheader_crit_edge:            ; preds = %for.end
  %indvars.iv.next26 = add nsw i32 %indvars.iv25, 1
  br label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30.for.body30_crit_edge, %for.body30.preheader
  %8 = phi double [ %sub44, %for.body30.for.body30_crit_edge ], [ %.pre41, %for.body30.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.body30.for.body30_crit_edge ], [ 0, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv35, i64 %indvars.iv29
  %9 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %9, %9
  %sub44 = fsub double %8, %mul39
  %sunkaddr54 = ptrtoint [2000 x double]* %arrayidx328 to i64
  %sunkaddr55 = mul i64 %indvars.iv35, 8
  %sunkaddr56 = add i64 %sunkaddr54, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  store double %sub44, double* %sunkaddr57, align 8
  %exitcond34 = icmp eq i64 %indvars.iv29, %wide.trip.count33
  br i1 %exitcond34, label %for.body30.for.end47_crit_edge, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  br label %for.body30

for.body30.for.end47_crit_edge:                   ; preds = %for.body30
  %.pre38 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end47

for.end47:                                        ; preds = %for.body, %for.body30.for.end47_crit_edge
  %10 = phi [2000 x double]* [ %.pre37, %for.body30.for.end47_crit_edge ], [ %0, %for.body ]
  %11 = phi [2000 x double]* [ %.pre38, %for.body30.for.end47_crit_edge ], [ %0, %for.body ]
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv35, i64 %indvars.iv35
  %12 = load double, double* %arrayidx51, align 8
  %call = call double @sqrt(double %12) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv35, i64 %indvars.iv35
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next36 = add i64 %indvars.iv35, 1
  %cmp = icmp slt i64 %indvars.iv.next36, 2000
  br i1 %cmp, label %for.end47.for.body_crit_edge, label %for.end58

for.end47.for.body_crit_edge:                     ; preds = %for.end47
  %indvars.iv.next32 = add i32 %indvars.iv31, 1
  br label %for.body

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.preheader, label %for.inc10

for.body4.preheader:                              ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end.for.body4_crit_edge, %for.body4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body4_crit_edge ], [ 0, %for.body4.preheader ]
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
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  br i1 %cmp3, label %if.end.for.body4_crit_edge, label %for.inc10.loopexit

if.end.for.body4_crit_edge:                       ; preds = %if.end
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br label %for.body4

for.inc10.loopexit:                               ; preds = %if.end
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.body
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body, label %for.end12

for.end12:                                        ; preds = %for.inc10
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
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = distinct !{!19, !10, !11}
