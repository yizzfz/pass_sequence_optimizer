; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph102.preheader:
  br label %.lr.ph102

.lr.ph102:                                        ; preds = %.lr.ph102, %.lr.ph102.preheader
  %indvars.iv131 = phi i64 [ 0, %.lr.ph102.preheader ], [ %indvars.iv.next132.1, %.lr.ph102 ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  %5 = bitcast double* %4 to <2 x double>*
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  %7 = bitcast double* %6 to <2 x double>*
  %8 = trunc i64 %indvars.iv131 to i32
  %9 = or i32 %8, 1
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv131
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %indvars.iv.next132.1 = add nuw nsw i64 %indvars.iv131, 2
  %12 = trunc i64 %indvars.iv.next132.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond133.1 = icmp eq i64 %indvars.iv.next132.1, 2000
  br i1 %exitcond133.1, label %.lr.ph95.preheader, label %.lr.ph102

.lr.ph95.preheader:                               ; preds = %.lr.ph102
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %.lr.ph95.preheader, %.lr.ph95.backedge
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %.lr.ph95.backedge ], [ 0, %.lr.ph95.preheader ]
  %indvars.iv126 = phi i64 [ %indvars.iv126.be, %.lr.ph95.backedge ], [ 1, %.lr.ph95.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv128, 2001
  %21 = sub i64 1998, %indvars.iv128
  %22 = shl i64 %21, 3
  br label %._crit_edge68

._crit_edge68.._crit_edge69_crit_edge:            ; preds = %._crit_edge68
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %23 = icmp slt i64 %indvars.iv.next129, 2000
  br i1 %23, label %._crit_edge.thread, label %._crit_edge

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph95
  %indvars.iv113 = phi i64 [ 0, %.lr.ph95 ], [ %indvars.iv.next114, %._crit_edge68 ]
  %24 = sub nsw i64 0, %indvars.iv113
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 2.000000e+03
  %29 = fadd double %28, 1.000000e+00
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv113
  store double %29, double* %30, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next114, %indvars.iv126
  br i1 %exitcond117, label %._crit_edge68.._crit_edge69_crit_edge, label %._crit_edge68

._crit_edge.thread:                               ; preds = %._crit_edge68.._crit_edge69_crit_edge
  %31 = and i64 %22, 34359738360
  %32 = add nuw nsw i64 %31, 8
  %33 = add nuw nsw i64 %20, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %33
  %34 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %34, i8 0, i64 %32, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph95.backedge

.lr.ph95.backedge:                                ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv126.be = add nuw nsw i64 %indvars.iv126, 1
  br label %.lr.ph95

._crit_edge:                                      ; preds = %._crit_edge68.._crit_edge69_crit_edge
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %36, align 8
  %exitcond130 = icmp eq i64 %indvars.iv.next129, 2000
  br i1 %exitcond130, label %._crit_edge71.._crit_edge72_crit_edge.lr.ph, label %.lr.ph95.backedge

._crit_edge71.._crit_edge72_crit_edge.lr.ph:      ; preds = %._crit_edge
  %37 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %38 = bitcast i8* %37 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %37, i8 0, i64 32000000, i32 8, i1 false)
  br label %._crit_edge71.._crit_edge72_crit_edge.us

._crit_edge71.._crit_edge72_crit_edge.us:         ; preds = %._crit_edge72._crit_edge.us, %._crit_edge71.._crit_edge72_crit_edge.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge72._crit_edge.us ], [ 0, %._crit_edge71.._crit_edge72_crit_edge.lr.ph ]
  br label %._crit_edge72.._crit_edge74_crit_edge.us.us

._crit_edge72._crit_edge.us:                      ; preds = %._crit_edge74._crit_edge.us.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond6, label %._crit_edge73.._crit_edge75_crit_edge.us.preheader, label %._crit_edge71.._crit_edge72_crit_edge.us

._crit_edge73.._crit_edge75_crit_edge.us.preheader: ; preds = %._crit_edge72._crit_edge.us
  br label %._crit_edge73.._crit_edge75_crit_edge.us

._crit_edge72.._crit_edge74_crit_edge.us.us:      ; preds = %._crit_edge74._crit_edge.us.us, %._crit_edge71.._crit_edge72_crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge74._crit_edge.us.us ], [ 0, %._crit_edge71.._crit_edge72_crit_edge.us ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv4
  br label %._crit_edge74.us.us

._crit_edge74._crit_edge.us.us:                   ; preds = %._crit_edge74.us.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge72._crit_edge.us, label %._crit_edge72.._crit_edge74_crit_edge.us.us

._crit_edge74.us.us:                              ; preds = %._crit_edge74.us.us, %._crit_edge72.._crit_edge74_crit_edge.us.us
  %indvars.iv104 = phi i64 [ 0, %._crit_edge72.._crit_edge74_crit_edge.us.us ], [ %indvars.iv.next105.1, %._crit_edge74.us.us ]
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv4
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv1, i64 %indvars.iv104
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %47 = load double, double* %39, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next105, i64 %indvars.iv4
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next105
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next105.1 = add nuw nsw i64 %indvars.iv104, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next105.1, 2000
  br i1 %exitcond106.1, label %._crit_edge74._crit_edge.us.us, label %._crit_edge74.us.us

._crit_edge73.._crit_edge75_crit_edge.us:         ; preds = %._crit_edge73.._crit_edge75_crit_edge.us.preheader, %._crit_edge75._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge75._crit_edge.us ], [ 0, %._crit_edge73.._crit_edge75_crit_edge.us.preheader ]
  %storemerge477.us = phi i64 [ %80, %._crit_edge75._crit_edge.us ], [ 0, %._crit_edge73.._crit_edge75_crit_edge.us.preheader ]
  %sext = shl i64 %storemerge477.us, 32
  %54 = ashr exact i64 %sext, 32
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us, %._crit_edge73.._crit_edge75_crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge73.._crit_edge75_crit_edge.us ], [ %indvars.iv.next.4, %._crit_edge75.us ]
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %54, i64 %indvars.iv
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %54, i64 %indvars.iv.next
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv.next
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %54, i64 %indvars.iv.next.1
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv.next.1
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %54, i64 %indvars.iv.next.2
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv.next.2
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %54, i64 %indvars.iv.next.3
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %54, i64 %indvars.iv.next.3
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge75._crit_edge.us, label %._crit_edge75.us

._crit_edge75._crit_edge.us:                      ; preds = %._crit_edge75.us
  %80 = add nsw i64 %54, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge73._crit_edge, label %._crit_edge73.._crit_edge75_crit_edge.us

._crit_edge73._crit_edge:                         ; preds = %._crit_edge75._crit_edge.us
  tail call void @free(i8* nonnull %37) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.preheader:
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge76._crit_edge, %.._crit_edge_crit_edge.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge76._crit_edge ], [ 0, %.._crit_edge_crit_edge.preheader ]
  %4 = add nuw nsw i64 %indvars.iv17, 4294967295
  %5 = icmp sgt i64 %indvars.iv17, 0
  br i1 %5, label %.lr.ph106.preheader, label %._crit_edge76._crit_edge

.lr.ph106.preheader:                              ; preds = %.._crit_edge_crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 0
  br label %.lr.ph106

.lr.ph113.split.us.preheader:                     ; preds = %._crit_edge
  %xtraiter155163 = and i64 %indvars.iv17, 1
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i64 %xtraiter155163, 0
  %9 = icmp eq i32 %7, 0
  br label %.lr.ph113.split.us

.lr.ph113.split.us:                               ; preds = %._crit_edge110.us, %.lr.ph113.split.us.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge110.us ], [ %indvars.iv17, %.lr.ph113.split.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv14
  %11 = load double, double* %10, align 8
  br i1 %8, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph113.split.us
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv14
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph113.split.us, %.prol.preheader
  %indvars.iv149.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph113.split.us ]
  %.unr157.ph = phi double [ %16, %.prol.preheader ], [ %11, %.lr.ph113.split.us ]
  %.lcssa126.unr.ph = phi double [ %16, %.prol.preheader ], [ undef, %.lr.ph113.split.us ]
  br i1 %9, label %._crit_edge110.us, label %.lr.ph113.split.us.new.preheader

.lr.ph113.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph113.split.us.new

.lr.ph113.split.us.new:                           ; preds = %.lr.ph113.split.us.new.preheader, %.lr.ph113.split.us.new
  %indvars.iv149 = phi i64 [ %indvars.iv.next150.1, %.lr.ph113.split.us.new ], [ %indvars.iv149.unr.ph, %.lr.ph113.split.us.new.preheader ]
  %17 = phi double [ %31, %.lr.ph113.split.us.new ], [ %.unr157.ph, %.lr.ph113.split.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv149
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv149, i64 %indvars.iv14
  %21 = load double, double* %20, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %22 = load <2 x double>, <2 x double>* %19, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next150, i64 %indvars.iv14
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fmul <2 x double> %22, %26
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %17, %28
  %31 = fsub double %30, %29
  %indvars.iv.next150.1 = add nuw nsw i64 %indvars.iv149, 2
  %exitcond154.1 = icmp eq i64 %indvars.iv.next150.1, %indvars.iv17
  br i1 %exitcond154.1, label %._crit_edge110.us.loopexit, label %.lr.ph113.split.us.new

._crit_edge110.us.loopexit:                       ; preds = %.lr.ph113.split.us.new
  br label %._crit_edge110.us

._crit_edge110.us:                                ; preds = %._crit_edge110.us.loopexit, %.prol.loopexit
  %.lcssa126 = phi double [ %.lcssa126.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge110.us.loopexit ]
  store double %.lcssa126, double* %10, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond16, label %._crit_edge76._crit_edge.loopexit, label %.lr.ph113.split.us

.lr.ph106:                                        ; preds = %._crit_edge, %.lr.ph106.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge ], [ 0, %.lr.ph106.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv10
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = bitcast i64 %34 to double
  %36 = icmp sgt i64 %indvars.iv10, 0
  br i1 %36, label %.lr.ph102.preheader, label %._crit_edge

.lr.ph102.preheader:                              ; preds = %.lr.ph106
  %xtraiter14327 = and i64 %indvars.iv10, 1
  %lcmp.mod144 = icmp eq i64 %xtraiter14327, 0
  br i1 %lcmp.mod144, label %.lr.ph102.prol.loopexit, label %.lr.ph102.prol

.lr.ph102.prol:                                   ; preds = %.lr.ph102.preheader
  %37 = load double, double* %6, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv10
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  %42 = bitcast double %41 to i64
  br label %.lr.ph102.prol.loopexit

.lr.ph102.prol.loopexit:                          ; preds = %.lr.ph102.preheader, %.lr.ph102.prol
  %indvars.iv137.unr.ph = phi i64 [ 1, %.lr.ph102.prol ], [ 0, %.lr.ph102.preheader ]
  %.sroa.0.099.unr.ph = phi i64 [ %42, %.lr.ph102.prol ], [ %34, %.lr.ph102.preheader ]
  %.lcssa125.unr.ph = phi double [ %41, %.lr.ph102.prol ], [ undef, %.lr.ph102.preheader ]
  %43 = icmp eq i64 %indvars.iv10, 1
  br i1 %43, label %._crit_edge, label %.lr.ph102.preheader21

.lr.ph102.preheader21:                            ; preds = %.lr.ph102.prol.loopexit
  br label %.lr.ph102

.lr.ph102:                                        ; preds = %.lr.ph102.preheader21, %.lr.ph102
  %indvars.iv137 = phi i64 [ %indvars.iv.next138.1, %.lr.ph102 ], [ %indvars.iv137.unr.ph, %.lr.ph102.preheader21 ]
  %.sroa.0.099 = phi i64 [ %59, %.lr.ph102 ], [ %.sroa.0.099.unr.ph, %.lr.ph102.preheader21 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv137
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv137, i64 %indvars.iv10
  %47 = load double, double* %46, align 8
  %48 = bitcast i64 %.sroa.0.099 to double
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %49 = load <2 x double>, <2 x double>* %45, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next138, i64 %indvars.iv10
  %51 = load double, double* %50, align 8
  %52 = insertelement <2 x double> undef, double %47, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %49, %53
  %55 = extractelement <2 x double> %54, i32 0
  %56 = extractelement <2 x double> %54, i32 1
  %57 = fsub double %48, %55
  %58 = fsub double %57, %56
  %59 = bitcast double %58 to i64
  %indvars.iv.next138.1 = add nuw nsw i64 %indvars.iv137, 2
  %exitcond140.1 = icmp eq i64 %indvars.iv.next138.1, %indvars.iv10
  br i1 %exitcond140.1, label %._crit_edge.loopexit, label %.lr.ph102

._crit_edge.loopexit:                             ; preds = %.lr.ph102
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph102.prol.loopexit, %.lr.ph106
  %.lcssa82 = phi double [ %35, %.lr.ph106 ], [ %.lcssa125.unr.ph, %.lr.ph102.prol.loopexit ], [ %58, %._crit_edge.loopexit ]
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv10
  %61 = load double, double* %60, align 8
  %62 = fdiv double %.lcssa82, %61
  store double %62, double* %32, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next11, %indvars.iv17
  br i1 %exitcond147, label %.lr.ph113.split.us.preheader, label %.lr.ph106

._crit_edge76._crit_edge.loopexit:                ; preds = %._crit_edge110.us
  br label %._crit_edge76._crit_edge

._crit_edge76._crit_edge:                         ; preds = %._crit_edge76._crit_edge.loopexit, %.._crit_edge_crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond162, label %.lr.ph98.preheader, label %.._crit_edge_crit_edge

.lr.ph98.preheader:                               ; preds = %._crit_edge76._crit_edge
  br label %.lr.ph98

.lr.ph98:                                         ; preds = %.lr.ph98.preheader, %._crit_edge75
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge75 ], [ 0, %.lr.ph98.preheader ]
  %indvars.iv6 = phi i2 [ %indvars.iv.next7, %._crit_edge75 ], [ 0, %.lr.ph98.preheader ]
  %63 = zext i2 %indvars.iv6 to i64
  %64 = add nuw nsw i64 %63, 4294967295
  %65 = and i64 %64, 4294967295
  %66 = add nuw nsw i64 %65, 1
  %67 = add i64 %indvars.iv8, 4294967295
  %68 = getelementptr inbounds double, double* %1, i64 %indvars.iv8
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv8, 0
  br i1 %70, label %.lr.ph94.preheader, label %._crit_edge75

.lr.ph94.preheader:                               ; preds = %.lr.ph98
  %71 = trunc i64 %indvars.iv8 to i32
  %xtraiter134 = and i32 %71, 3
  %lcmp.mod135 = icmp eq i32 %xtraiter134, 0
  br i1 %lcmp.mod135, label %.lr.ph94.prol.loopexit, label %.lr.ph94.prol.preheader

.lr.ph94.prol.preheader:                          ; preds = %.lr.ph94.preheader
  br label %.lr.ph94.prol

.lr.ph94.prol:                                    ; preds = %.lr.ph94.prol.preheader, %.lr.ph94.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph94.prol ], [ 0, %.lr.ph94.prol.preheader ]
  %72 = phi double [ %78, %.lr.ph94.prol ], [ %69, %.lr.ph94.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph94.prol ], [ %xtraiter134, %.lr.ph94.prol.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fsub double %72, %77
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph94.prol.loopexit.loopexit, label %.lr.ph94.prol, !llvm.loop !1

.lr.ph94.prol.loopexit.loopexit:                  ; preds = %.lr.ph94.prol
  br label %.lr.ph94.prol.loopexit

.lr.ph94.prol.loopexit:                           ; preds = %.lr.ph94.prol.loopexit.loopexit, %.lr.ph94.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph94.preheader ], [ %66, %.lr.ph94.prol.loopexit.loopexit ]
  %.unr = phi double [ %69, %.lr.ph94.preheader ], [ %78, %.lr.ph94.prol.loopexit.loopexit ]
  %.lcssa124.unr = phi double [ undef, %.lr.ph94.preheader ], [ %78, %.lr.ph94.prol.loopexit.loopexit ]
  %79 = trunc i64 %67 to i32
  %80 = icmp ult i32 %79, 3
  br i1 %80, label %._crit_edge75, label %.lr.ph94.preheader20

.lr.ph94.preheader20:                             ; preds = %.lr.ph94.prol.loopexit
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %.lr.ph94.preheader20, %.lr.ph94
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph94 ], [ %indvars.iv.unr, %.lr.ph94.preheader20 ]
  %81 = phi double [ %103, %.lr.ph94 ], [ %.unr, %.lr.ph94.preheader20 ]
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %83 = bitcast double* %82 to <2 x double>*
  %84 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %85 = bitcast double* %84 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %83, align 8
  %87 = load <2 x double>, <2 x double>* %85, align 8
  %88 = fmul <2 x double> %86, %87
  %89 = extractelement <2 x double> %88, i32 0
  %90 = extractelement <2 x double> %88, i32 1
  %91 = fsub double %81, %89
  %92 = fsub double %91, %90
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to <2 x double>*
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond131.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv8
  br i1 %exitcond131.3, label %._crit_edge75.loopexit, label %.lr.ph94

._crit_edge75.loopexit:                           ; preds = %.lr.ph94
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge75.loopexit, %.lr.ph94.prol.loopexit, %.lr.ph98
  %.lcssa81 = phi double [ %69, %.lr.ph98 ], [ %.lcssa124.unr, %.lr.ph94.prol.loopexit ], [ %103, %._crit_edge75.loopexit ]
  %104 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %.lcssa81, double* %104, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next9, 2000
  %indvars.iv.next7 = add i2 %indvars.iv6, 1
  br i1 %exitcond136, label %.lr.ph91.preheader, label %.lr.ph98

.lr.ph91.preheader:                               ; preds = %._crit_edge75
  %sunkaddr = ptrtoint double* %2 to i64
  br label %.lr.ph91

.lr.ph91:                                         ; preds = %.lr.ph91.preheader, %._crit_edge77
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge77 ], [ 2000, %.lr.ph91.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge77 ], [ 0, %.lr.ph91.preheader ]
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, -1
  %105 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next130
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = bitcast i64 %107 to double
  %109 = icmp slt i64 %indvars.iv129, 2000
  br i1 %109, label %.lr.ph.preheader, label %._crit_edge77

.lr.ph.preheader:                                 ; preds = %.lr.ph91
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next130, i64 %indvars.iv129
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %2, i64 %indvars.iv129
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fsub double %108, %114
  %116 = bitcast double %115 to i64
  %indvars.iv.next128.prol = add nuw nsw i64 %indvars.iv129, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv127.unr.ph = phi i64 [ %indvars.iv.next128.prol, %.lr.ph.prol ], [ %indvars.iv129, %.lr.ph.preheader ]
  %.sroa.0.385.unr.ph = phi i64 [ %116, %.lr.ph.prol ], [ %107, %.lr.ph.preheader ]
  %.lcssa123.unr.ph = phi double [ %115, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %117 = icmp eq i32 %indvar, 1
  br i1 %117, label %._crit_edge77, label %.lr.ph.preheader19

.lr.ph.preheader19:                               ; preds = %.lr.ph.prol.loopexit
  %118 = sub i64 1998, %indvars.iv127.unr.ph
  %119 = lshr i64 %118, 1
  %120 = and i64 %119, 1
  %lcmp.mod35 = icmp eq i64 %120, 0
  br i1 %lcmp.mod35, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit33.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader19
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next130, i64 %indvars.iv127.unr.ph
  %122 = bitcast double* %121 to <2 x double>*
  %123 = getelementptr inbounds double, double* %2, i64 %indvars.iv127.unr.ph
  %124 = bitcast double* %123 to <2 x double>*
  %125 = bitcast i64 %.sroa.0.385.unr.ph to double
  %126 = load <2 x double>, <2 x double>* %122, align 8
  %127 = load <2 x double>, <2 x double>* %124, align 8
  %128 = fmul <2 x double> %126, %127
  %129 = extractelement <2 x double> %128, i32 0
  %130 = extractelement <2 x double> %128, i32 1
  %131 = fsub double %125, %129
  %132 = fsub double %131, %130
  %133 = bitcast double %132 to i64
  %indvars.iv.next128.1.prol = add nsw i64 %indvars.iv127.unr.ph, 2
  br label %.lr.ph.prol.loopexit33.unr-lcssa

.lr.ph.prol.loopexit33.unr-lcssa:                 ; preds = %.lr.ph.preheader19, %.lr.ph.prol.preheader
  %.lcssa28.unr.ph = phi double [ %132, %.lr.ph.prol.preheader ], [ undef, %.lr.ph.preheader19 ]
  %indvars.iv127.unr.ph37 = phi i64 [ %indvars.iv.next128.1.prol, %.lr.ph.prol.preheader ], [ %indvars.iv127.unr.ph, %.lr.ph.preheader19 ]
  %.sroa.0.385.unr.ph38 = phi i64 [ %133, %.lr.ph.prol.preheader ], [ %.sroa.0.385.unr.ph, %.lr.ph.preheader19 ]
  %134 = icmp eq i64 %119, 0
  br i1 %134, label %._crit_edge77.loopexit, label %.lr.ph.preheader19.new

.lr.ph.preheader19.new:                           ; preds = %.lr.ph.prol.loopexit33.unr-lcssa
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader19.new
  %indvars.iv127 = phi i64 [ %indvars.iv127.unr.ph37, %.lr.ph.preheader19.new ], [ %indvars.iv.next128.1.1, %.lr.ph ]
  %.sroa.0.385 = phi i64 [ %.sroa.0.385.unr.ph38, %.lr.ph.preheader19.new ], [ %158, %.lr.ph ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next130, i64 %indvars.iv127
  %136 = bitcast double* %135 to <2 x double>*
  %137 = getelementptr inbounds double, double* %2, i64 %indvars.iv127
  %138 = bitcast double* %137 to <2 x double>*
  %139 = bitcast i64 %.sroa.0.385 to double
  %140 = load <2 x double>, <2 x double>* %136, align 8
  %141 = load <2 x double>, <2 x double>* %138, align 8
  %142 = fmul <2 x double> %140, %141
  %143 = extractelement <2 x double> %142, i32 0
  %144 = extractelement <2 x double> %142, i32 1
  %145 = fsub double %139, %143
  %146 = fsub double %145, %144
  %indvars.iv.next128.1 = add nsw i64 %indvars.iv127, 2
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next130, i64 %indvars.iv.next128.1
  %148 = bitcast double* %147 to <2 x double>*
  %149 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next128.1
  %150 = bitcast double* %149 to <2 x double>*
  %151 = load <2 x double>, <2 x double>* %148, align 8
  %152 = load <2 x double>, <2 x double>* %150, align 8
  %153 = fmul <2 x double> %151, %152
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %156 = fsub double %146, %154
  %157 = fsub double %156, %155
  %158 = bitcast double %157 to i64
  %indvars.iv.next128.1.1 = add nsw i64 %indvars.iv127, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next128.1.1, 2000
  br i1 %exitcond.1.1, label %._crit_edge77.loopexit.unr-lcssa, label %.lr.ph

._crit_edge77.loopexit.unr-lcssa:                 ; preds = %.lr.ph
  br label %._crit_edge77.loopexit

._crit_edge77.loopexit:                           ; preds = %.lr.ph.prol.loopexit33.unr-lcssa, %._crit_edge77.loopexit.unr-lcssa
  %.lcssa28 = phi double [ %.lcssa28.unr.ph, %.lr.ph.prol.loopexit33.unr-lcssa ], [ %157, %._crit_edge77.loopexit.unr-lcssa ]
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.lr.ph.prol.loopexit, %.lr.ph91
  %.lcssa = phi double [ %108, %.lr.ph91 ], [ %.lcssa123.unr.ph, %.lr.ph.prol.loopexit ], [ %.lcssa28, %._crit_edge77.loopexit ]
  %159 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next130, i64 %indvars.iv.next130
  %160 = load double, double* %159, align 8
  %161 = fdiv double %.lcssa, %160
  %sunkaddr177 = shl i64 %indvars.iv129, 3
  %sunkaddr178 = add i64 %sunkaddr, %sunkaddr177
  %sunkaddr179 = add i64 %sunkaddr178, -8
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to double*
  store double %161, double* %sunkaddr180, align 8
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge77._crit_edge, label %.lr.ph91

._crit_edge77._crit_edge:                         ; preds = %._crit_edge77
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge6, label %.lr.ph

._crit_edge6:                                     ; preds = %._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
