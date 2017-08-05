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
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
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
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body.lr.ph, %for.inc23.for.body_crit_edge
  %indvars.iv108 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next109, %for.inc23.for.body_crit_edge ]
  %indvars.iv106 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next107, %for.inc23.for.body_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv108, 2001
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv93 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next94, %for.inc ]
  %1 = sub nsw i64 0, %indvars.iv93
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv93
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next94, %indvars.iv106
  br i1 %exitcond98, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %cmp940 = icmp slt i64 %indvars.iv.next109, 2000
  br i1 %cmp940, label %for.inc23.thread, label %for.inc23

for.inc23.thread:                                 ; preds = %for.end
  %3 = sub i64 1998, %indvars.iv108
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = add nuw nsw i64 %0, 1
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %7 = add nuw nsw i64 %5, 8
  %scevgep104105 = bitcast double* %scevgep104 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep104105, i8 0, i64 %7, i32 8, i1 false)
  %arrayidx221 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv108
  store double 1.000000e+00, double* %arrayidx221, align 8
  br label %for.inc23.for.body_crit_edge

for.inc23:                                        ; preds = %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv108
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond110 = icmp eq i64 %indvars.iv.next109, 2000
  br i1 %exitcond110, label %for.body47.us.preheader, label %for.inc23.for.body_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.inc23.thread, %for.inc23
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  br label %for.inc.lr.ph

for.body47.us.preheader:                          ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body51.us.us.preheader

for.body51.us.us.preheader:                       ; preds = %for.inc75.us, %for.body47.us.preheader
  %indvars.iv84 = phi i64 [ 0, %for.body47.us.preheader ], [ %12, %for.inc75.us ]
  %scevgep4 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv84
  %scevgep45 = bitcast double* %scevgep4 to i8*
  %12 = add nuw nsw i64 %indvars.iv84, 1
  %scevgep6 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %12
  %scevgep67 = bitcast double* %scevgep6 to i8*
  br label %for.body51.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %exitcond86 = icmp eq i64 %12, 2000
  br i1 %exitcond86, label %for.body81.us.preheader, label %for.body51.us.us.preheader

for.body51.us.us:                                 ; preds = %for.inc72.us.us, %for.body51.us.us.preheader
  %indvars.iv81 = phi i64 [ 0, %for.body51.us.us.preheader ], [ %indvars.iv.next82, %for.inc72.us.us ]
  %13 = mul nuw nsw i64 %indvars.iv81, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  %14 = add nuw nsw i64 %13, 16000
  %scevgep3 = getelementptr i8, i8* %call, i64 %14
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv84
  %bound0 = icmp ult i8* %scevgep, %scevgep67
  %bound1 = icmp ult i8* %scevgep45, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound09 = icmp ult i8* %scevgep, %bc
  %bound110 = icmp ult i8* %bc, %scevgep3
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %15 = or i64 %index, 1
  %16 = or i64 %index, 2
  %17 = or i64 %index, 3
  %18 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv84
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %15, i64 %indvars.iv84
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %16, i64 %indvars.iv84
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %17, i64 %indvars.iv84
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
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv81, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %39 = fadd <2 x double> %33, %wide.load
  %40 = fadd <2 x double> %34, %wide.load13
  store <2 x double> %39, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %40, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %41 = icmp eq i64 %index.next, 2000
  br i1 %41, label %for.inc72.us.us.loopexit44, label %vector.body, !llvm.loop !9

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us
  br label %for.inc72.us.us

for.inc72.us.us.loopexit44:                       ; preds = %vector.body
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit44, %for.inc72.us.us.loopexit
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond83, label %for.inc75.us, label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv78 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next79.1, %for.inc69.us.us ]
  %42 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv84
  %43 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %42, %43
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv81, i64 %indvars.iv78
  %44 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %44
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next79 = or i64 %indvars.iv78, 1
  %45 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next79, i64 %indvars.iv84
  %46 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %45, %46
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next79
  %47 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %47
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next79.1, 2000
  br i1 %exitcond80.1, label %for.inc72.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !12

for.body81.us.preheader:                          ; preds = %for.inc75.us
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.inc97.us, %for.body81.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.body81.us.preheader ], [ %48, %for.inc97.us ]
  %scevgep19 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 0
  %48 = add nuw nsw i64 %indvars.iv75, 1
  %scevgep21 = getelementptr [2000 x double], [2000 x double]* %A, i64 %48, i64 0
  %scevgep23 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 0
  %scevgep25 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %48, i64 0
  %bound027 = icmp ult double* %scevgep19, %scevgep25
  %bound128 = icmp ult double* %scevgep23, %scevgep21
  %memcheck.conflict30 = and i1 %bound027, %bound128
  br i1 %memcheck.conflict30, label %for.inc94.us.preheader, label %vector.body14.preheader

vector.body14.preheader:                          ; preds = %for.body81.us
  br label %vector.body14

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body14:                                    ; preds = %vector.body14, %vector.body14.preheader
  %index33 = phi i64 [ 0, %vector.body14.preheader ], [ %index.next34.1, %vector.body14 ]
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %index33
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load41 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !13
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !13
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %index33
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load41, <2 x i64>* %54, align 8, !alias.scope !16, !noalias !13
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %56, align 8, !alias.scope !16, !noalias !13
  %index.next34 = or i64 %index33, 4
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %index.next34
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load41.1 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !13
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !13
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %index.next34
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load41.1, <2 x i64>* %62, align 8, !alias.scope !16, !noalias !13
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %64, align 8, !alias.scope !16, !noalias !13
  %index.next34.1 = add nsw i64 %index33, 8
  %65 = icmp eq i64 %index.next34.1, 2000
  br i1 %65, label %for.inc97.us.loopexit43, label %vector.body14, !llvm.loop !18

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %66 = bitcast double* %arrayidx89.us to i64*
  %67 = load i64, i64* %66, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv
  %68 = bitcast double* %arrayidx93.us to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %69 = bitcast double* %arrayidx89.us.1 to i64*
  %70 = load i64, i64* %69, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next
  %71 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %70, i64* %71, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx89.us.2 to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %74 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %75 = bitcast double* %arrayidx89.us.3 to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %77 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %78 = bitcast double* %arrayidx89.us.4 to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %80 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc97.us.loopexit, label %for.inc94.us, !llvm.loop !19

for.inc97.us.loopexit:                            ; preds = %for.inc94.us
  br label %for.inc97.us

for.inc97.us.loopexit43:                          ; preds = %vector.body14
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit43, %for.inc97.us.loopexit
  %exitcond77 = icmp eq i64 %48, 2000
  br i1 %exitcond77, label %for.end99, label %for.body81.us

for.end99:                                        ; preds = %for.inc97.us
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
for.body.preheader:
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc54
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc54 ], [ 0, %for.body.preheader ]
  %cmp27 = icmp sgt i64 %indvars.iv46, 0
  br i1 %cmp27, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc25 ], [ 0, %for.body3.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv28, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv28
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter = and i64 %indvars.iv28, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %0 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv28
  %1 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %0, %1
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %2 = icmp eq i64 %indvars.iv28, 1
  br i1 %2, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %4 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv28
  %5 = load double, double* %arrayidx12, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv28
  %7 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %6, %7
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv28
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %8 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv28
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next29, %indvars.iv46
  br i1 %exitcond33, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter52 = and i64 %indvars.iv46, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter52, 0
  %10 = icmp eq i64 %indvars.iv46, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc51.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.inc51.us ], [ %indvars.iv46, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv42
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod53, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv42
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr54.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.body30.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.inc51.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.body30.us.new ], [ %indvars.iv.next36.1, %for.inc48.us ]
  %13 = phi double [ %.unr54.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv35
  %14 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv42
  %15 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %14, %15
  %sub47.us = fsub double %13, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next36
  %16 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv42
  %17 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %16, %17
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next36.1, %indvars.iv46
  br i1 %exitcond39.1, label %for.inc51.us.unr-lcssa, label %for.inc48.us

for.inc51.us.unr-lcssa:                           ; preds = %for.inc48.us
  br label %for.inc51.us

for.inc51.us:                                     ; preds = %for.inc48.us.prol.loopexit, %for.inc51.us.unr-lcssa
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond50, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.inc51.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.body
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond51, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc10.us, %for.body.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next10, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv9, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond14, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.inc10.us
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
