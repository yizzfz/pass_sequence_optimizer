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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv66 = phi i64 [ 0, %4 ], [ %indvars.iv.next67.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv66
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv66
  %9 = bitcast double* %8 to <2 x double>*
  %10 = trunc i64 %indvars.iv66 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv66
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %14 = trunc i64 %indvars.iv.next67.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67.1, 2000
  br i1 %exitcond68.1, label %.lr.ph.preheader, label %5

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv61.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv63, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %scevgep60 = bitcast double* %scevgep to i8*
  %24 = sub i64 1998, %indvars.iv63
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %29

.preheader14:                                     ; preds = %29
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %28 = icmp slt i64 %indvars.iv.next64, 2000
  br i1 %28, label %._crit_edge.thread, label %._crit_edge

; <label>:29:                                     ; preds = %29, %.lr.ph
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %29 ], [ 0, %.lr.ph ]
  %30 = sub nsw i64 0, %indvars.iv46
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = fadd double %34, 1.000000e+00
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv46
  store double %35, double* %36, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next47, %indvars.iv61
  br i1 %exitcond54, label %.preheader14, label %29

._crit_edge.thread:                               ; preds = %.preheader14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep60, i8 0, i64 %27, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph.backedge

._crit_edge:                                      ; preds = %.preheader14
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  store double 1.000000e+00, double* %38, align 8
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %.preheader11.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv61.be = add nuw nsw i64 %indvars.iv61, 1
  br label %.lr.ph

.preheader11.preheader:                           ; preds = %._crit_edge
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %39, i8 0, i64 32000000, i32 8, i1 false)
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader11

.preheader11:                                     ; preds = %58, %.preheader11.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader11.preheader ], [ %indvars.iv.next38, %58 ]
  br label %.preheader10

.preheader10:                                     ; preds = %57, %.preheader11
  %indvars.iv34 = phi i64 [ 0, %.preheader11 ], [ %indvars.iv.next35, %57 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv37
  br label %42

; <label>:42:                                     ; preds = %42, %.preheader10
  %indvars.iv31 = phi i64 [ 0, %.preheader10 ], [ %indvars.iv.next32.1, %42 ]
  %43 = load double, double* %41, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv37
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv34, i64 %indvars.iv31
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %50 = load double, double* %41, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next32, i64 %indvars.iv37
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv34, i64 %indvars.iv.next32
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next32.1, 2000
  br i1 %exitcond33.1, label %57, label %42

; <label>:57:                                     ; preds = %42
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond36, label %58, label %.preheader10

; <label>:58:                                     ; preds = %57
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond39, label %.preheader.preheader, label %.preheader11

.preheader.preheader:                             ; preds = %58
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %85
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %85 ], [ 0, %.preheader.preheader ]
  br label %59

; <label>:59:                                     ; preds = %59, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %59 ]
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv29, i64 %indvars.iv
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv29, i64 %indvars.iv.next
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv29, i64 %indvars.iv.next.1
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next.1
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv29, i64 %indvars.iv.next.2
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next.2
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv29, i64 %indvars.iv.next.3
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next.3
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %85, label %59

; <label>:85:                                     ; preds = %59
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, 2000
  br i1 %exitcond, label %86, label %.preheader

; <label>:86:                                     ; preds = %85
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge38, %4
  %indvars.iv97 = phi i64 [ 0, %4 ], [ %indvars.iv.next98, %._crit_edge38 ]
  %5 = add i64 %indvars.iv97, 4294967295
  %6 = icmp sgt i64 %indvars.iv97, 0
  br i1 %6, label %.lr.ph29.preheader, label %._crit_edge38

.lr.ph29.preheader:                               ; preds = %.preheader12
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 0
  br label %.lr.ph29

.lr.ph37:                                         ; preds = %._crit_edge26
  %8 = icmp sgt i64 %indvars.iv97, 0
  br i1 %8, label %.lr.ph37.split.us.preheader, label %._crit_edge38

.lr.ph37.split.us.preheader:                      ; preds = %.lr.ph37
  %xtraiter88100 = and i64 %indvars.iv97, 1
  %lcmp.mod89 = icmp eq i64 %xtraiter88100, 0
  %9 = trunc i64 %5 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 0
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %.lr.ph37.split.us.preheader, %._crit_edge34.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge34.us ], [ %indvars.iv97, %.lr.ph37.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv92
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod89, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph37.split.us
  %14 = load double, double* %11, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv92
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %13, %17
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph37.split.us
  %indvars.iv82.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph37.split.us ]
  %.131.us.unr.ph = phi double [ %18, %.prol.preheader ], [ %13, %.lr.ph37.split.us ]
  %.lcssa45.unr.ph = phi double [ %18, %.prol.preheader ], [ undef, %.lr.ph37.split.us ]
  br i1 %10, label %._crit_edge34.us, label %.lr.ph37.split.us.new.preheader

.lr.ph37.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph37.split.us.new

.lr.ph37.split.us.new:                            ; preds = %.lr.ph37.split.us.new.preheader, %.lr.ph37.split.us.new
  %indvars.iv82 = phi i64 [ %indvars.iv.next83.1, %.lr.ph37.split.us.new ], [ %indvars.iv82.unr.ph, %.lr.ph37.split.us.new.preheader ]
  %.131.us = phi double [ %32, %.lr.ph37.split.us.new ], [ %.131.us.unr.ph, %.lr.ph37.split.us.new.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv82
  %20 = bitcast double* %19 to <2 x double>*
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv92
  %22 = load double, double* %21, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %23 = load <2 x double>, <2 x double>* %20, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next83, i64 %indvars.iv92
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %22, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %23, %27
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %31 = fsub double %.131.us, %29
  %32 = fsub double %31, %30
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next83.1, %indvars.iv97
  br i1 %exitcond87.1, label %._crit_edge34.us.loopexit, label %.lr.ph37.split.us.new

._crit_edge34.us.loopexit:                        ; preds = %.lr.ph37.split.us.new
  br label %._crit_edge34.us

._crit_edge34.us:                                 ; preds = %._crit_edge34.us.loopexit, %.prol.loopexit
  %.lcssa45 = phi double [ %.lcssa45.unr.ph, %.prol.loopexit ], [ %32, %._crit_edge34.us.loopexit ]
  store double %.lcssa45, double* %12, align 8
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next93, 2000
  br i1 %exitcond94, label %._crit_edge38.loopexit, label %.lr.ph37.split.us

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %._crit_edge26
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge26 ], [ 0, %.lr.ph29.preheader ]
  %33 = add i64 %indvars.iv72, 4294967295
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv72
  %35 = load double, double* %34, align 8
  %36 = icmp sgt i64 %indvars.iv72, 0
  br i1 %36, label %.lr.ph25.preheader, label %._crit_edge26

.lr.ph25.preheader:                               ; preds = %.lr.ph29
  %xtraiter68101 = and i64 %indvars.iv72, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter68101, 0
  br i1 %lcmp.mod69, label %.lr.ph25.prol.loopexit, label %.lr.ph25.prol

.lr.ph25.prol:                                    ; preds = %.lr.ph25.preheader
  %37 = load double, double* %7, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv72
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.lr.ph25.prol.loopexit

.lr.ph25.prol.loopexit:                           ; preds = %.lr.ph25.prol, %.lr.ph25.preheader
  %indvars.iv63.unr.ph = phi i64 [ 1, %.lr.ph25.prol ], [ 0, %.lr.ph25.preheader ]
  %.023.unr.ph = phi double [ %41, %.lr.ph25.prol ], [ %35, %.lr.ph25.preheader ]
  %.lcssa44.unr.ph = phi double [ %41, %.lr.ph25.prol ], [ undef, %.lr.ph25.preheader ]
  %42 = trunc i64 %33 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %._crit_edge26, label %.lr.ph25.preheader19

.lr.ph25.preheader19:                             ; preds = %.lr.ph25.prol.loopexit
  br label %.lr.ph25

.lr.ph25:                                         ; preds = %.lr.ph25.preheader19, %.lr.ph25
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.lr.ph25 ], [ %indvars.iv63.unr.ph, %.lr.ph25.preheader19 ]
  %.023 = phi double [ %57, %.lr.ph25 ], [ %.023.unr.ph, %.lr.ph25.preheader19 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv97, i64 %indvars.iv63
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv72
  %47 = load double, double* %46, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next64, i64 %indvars.iv72
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.023, %54
  %57 = fsub double %56, %55
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %indvars.iv72
  br i1 %exitcond67.1, label %._crit_edge26.loopexit, label %.lr.ph25

._crit_edge26.loopexit:                           ; preds = %.lr.ph25
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26.loopexit, %.lr.ph25.prol.loopexit, %.lr.ph29
  %.0.lcssa = phi double [ %35, %.lr.ph29 ], [ %.lcssa44.unr.ph, %.lr.ph25.prol.loopexit ], [ %57, %._crit_edge26.loopexit ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv72
  %59 = load double, double* %58, align 8
  %60 = fdiv double %.0.lcssa, %59
  store double %60, double* %34, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next73, %indvars.iv97
  br i1 %exitcond80, label %.lr.ph37, label %.lr.ph29

._crit_edge38.loopexit:                           ; preds = %._crit_edge34.us
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %.preheader12, %.lr.ph37
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond99, label %.preheader10.preheader, label %.preheader12

.preheader10.preheader:                           ; preds = %._crit_edge38
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.preheader, %._crit_edge19
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge19 ], [ 0, %.preheader10.preheader ]
  %61 = add i64 %indvars.iv60, 4294967295
  %62 = getelementptr inbounds double, double* %1, i64 %indvars.iv60
  %63 = load double, double* %62, align 8
  %64 = icmp sgt i64 %indvars.iv60, 0
  br i1 %64, label %.lr.ph18.preheader, label %._crit_edge19

.lr.ph18.preheader:                               ; preds = %.preheader10
  %65 = trunc i64 %indvars.iv60 to i32
  %xtraiter55 = and i32 %65, 3
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  br i1 %lcmp.mod56, label %.lr.ph18.prol.loopexit, label %.lr.ph18.prol.preheader

.lr.ph18.prol.preheader:                          ; preds = %.lr.ph18.preheader
  br label %.lr.ph18.prol

.lr.ph18.prol:                                    ; preds = %.lr.ph18.prol.preheader, %.lr.ph18.prol
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph18.prol ], [ 0, %.lr.ph18.prol.preheader ]
  %.216.prol = phi double [ %71, %.lr.ph18.prol ], [ %63, %.lr.ph18.prol.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %.lr.ph18.prol ], [ %xtraiter55, %.lr.ph18.prol.preheader ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv50.prol
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv50.prol
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fsub double %.216.prol, %70
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter57.sub = add i32 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i32 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.lr.ph18.prol.loopexit.loopexit, label %.lr.ph18.prol, !llvm.loop !1

.lr.ph18.prol.loopexit.loopexit:                  ; preds = %.lr.ph18.prol
  br label %.lr.ph18.prol.loopexit

.lr.ph18.prol.loopexit:                           ; preds = %.lr.ph18.prol.loopexit.loopexit, %.lr.ph18.preheader
  %indvars.iv50.unr = phi i64 [ 0, %.lr.ph18.preheader ], [ %indvars.iv.next51.prol, %.lr.ph18.prol.loopexit.loopexit ]
  %.216.unr = phi double [ %63, %.lr.ph18.preheader ], [ %71, %.lr.ph18.prol.loopexit.loopexit ]
  %.lcssa43.unr = phi double [ undef, %.lr.ph18.preheader ], [ %71, %.lr.ph18.prol.loopexit.loopexit ]
  %72 = trunc i64 %61 to i32
  %73 = icmp ult i32 %72, 3
  br i1 %73, label %._crit_edge19, label %.lr.ph18.preheader18

.lr.ph18.preheader18:                             ; preds = %.lr.ph18.prol.loopexit
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %.lr.ph18.preheader18, %.lr.ph18
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph18 ], [ %indvars.iv50.unr, %.lr.ph18.preheader18 ]
  %.216 = phi double [ %95, %.lr.ph18 ], [ %.216.unr, %.lr.ph18.preheader18 ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv50
  %75 = bitcast double* %74 to <2 x double>*
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %77 = bitcast double* %76 to <2 x double>*
  %78 = load <2 x double>, <2 x double>* %75, align 8
  %79 = load <2 x double>, <2 x double>* %77, align 8
  %80 = fmul <2 x double> %78, %79
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = fsub double %.216, %81
  %84 = fsub double %83, %82
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv.next51.1
  %86 = bitcast double* %85 to <2 x double>*
  %87 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.1
  %88 = bitcast double* %87 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %86, align 8
  %90 = load <2 x double>, <2 x double>* %88, align 8
  %91 = fmul <2 x double> %89, %90
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fsub double %84, %92
  %95 = fsub double %94, %93
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %exitcond54.3 = icmp eq i64 %indvars.iv.next51.3, %indvars.iv60
  br i1 %exitcond54.3, label %._crit_edge19.loopexit, label %.lr.ph18

._crit_edge19.loopexit:                           ; preds = %.lr.ph18
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.lr.ph18.prol.loopexit, %.preheader10
  %.2.lcssa = phi double [ %63, %.preheader10 ], [ %.lcssa43.unr, %.lr.ph18.prol.loopexit ], [ %95, %._crit_edge19.loopexit ]
  %96 = getelementptr inbounds double, double* %3, i64 %indvars.iv60
  store double %.2.lcssa, double* %96, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond62, label %.preheader.preheader, label %.preheader10

.preheader.preheader:                             ; preds = %._crit_edge19
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge ], [ 1999, %.preheader.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 2000, %.preheader.preheader ]
  %97 = add nsw i32 %indvar, -1
  %98 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  %99 = load double, double* %98, align 8
  %100 = add nuw nsw i64 %indvars.iv48, 1
  %101 = icmp slt i64 %100, 2000
  br i1 %101, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %.313.prol = phi double [ %107, %.lr.ph.prol ], [ %99, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46.prol
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds double, double* %2, i64 %indvars.iv46.prol
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = fsub double %.313.prol, %106
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv46.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %indvars.iv.next47.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.313.unr = phi double [ %99, %.lr.ph.preheader ], [ %107, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %107, %.lr.ph.prol.loopexit.loopexit ]
  %108 = icmp ult i32 %97, 3
  br i1 %108, label %._crit_edge, label %.lr.ph.preheader17

.lr.ph.preheader17:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader17, %.lr.ph
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph ], [ %indvars.iv46.unr, %.lr.ph.preheader17 ]
  %.313 = phi double [ %130, %.lr.ph ], [ %.313.unr, %.lr.ph.preheader17 ]
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv46
  %110 = bitcast double* %109 to <2 x double>*
  %111 = getelementptr inbounds double, double* %2, i64 %indvars.iv46
  %112 = bitcast double* %111 to <2 x double>*
  %113 = load <2 x double>, <2 x double>* %110, align 8
  %114 = load <2 x double>, <2 x double>* %112, align 8
  %115 = fmul <2 x double> %113, %114
  %116 = extractelement <2 x double> %115, i32 0
  %117 = extractelement <2 x double> %115, i32 1
  %118 = fsub double %.313, %116
  %119 = fsub double %118, %117
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next47.1
  %121 = bitcast double* %120 to <2 x double>*
  %122 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next47.1
  %123 = bitcast double* %122 to <2 x double>*
  %124 = load <2 x double>, <2 x double>* %121, align 8
  %125 = load <2 x double>, <2 x double>* %123, align 8
  %126 = fmul <2 x double> %124, %125
  %127 = extractelement <2 x double> %126, i32 0
  %128 = extractelement <2 x double> %126, i32 1
  %129 = fsub double %119, %127
  %130 = fsub double %129, %128
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next47.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %99, %.preheader ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %130, %._crit_edge.loopexit ]
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv48
  %132 = load double, double* %131, align 8
  %133 = fdiv double %.3.lcssa, %132
  %134 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  store double %133, double* %134, align 8
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, -1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %135, label %.preheader

; <label>:135:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %10, %6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!3 = distinct !{!3, !2}
