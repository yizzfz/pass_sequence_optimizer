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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(double* %16)
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
define internal fastcc void @init_array([2000 x double]*, double*, double*, double*) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv131 = phi i64 [ 0, %4 ], [ %indvars.iv.next132.1, %5 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv131
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next132 = or i64 %indvars.iv131, 1
  %8 = trunc i64 %indvars.iv.next132 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv131
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next132
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next132
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  %16 = trunc i64 %indvars.iv.next132.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next132
  store double %20, double* %21, align 8
  %exitcond133.1 = icmp eq i64 %indvars.iv.next132.1, 2000
  br i1 %exitcond133.1, label %.lr.ph.preheader, label %5

.lr.ph.preheader:                                 ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph.backedge
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %.lr.ph.backedge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv126 = phi i64 [ %indvars.iv126.be, %.lr.ph.backedge ], [ 1, %.lr.ph.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv128, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %24 = sub i64 1998, %indvars.iv128
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %28

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv113
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv113
  store double %34, double* %35, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next114, %indvars.iv126
  br i1 %exitcond117, label %._crit_edge, label %28

._crit_edge:                                      ; preds = %28
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %36 = icmp slt i64 %indvars.iv.next129, 2000
  br i1 %36, label %._crit_edge99.thread, label %._crit_edge99

._crit_edge99.thread:                             ; preds = %._crit_edge
  %37 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 %27, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph.backedge

._crit_edge99:                                    ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv128, i64 %indvars.iv128
  store double 1.000000e+00, double* %39, align 8
  %exitcond130 = icmp eq i64 %indvars.iv.next129, 2000
  br i1 %exitcond130, label %.preheader83.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge99, %._crit_edge99.thread
  %indvars.iv126.be = add nuw nsw i64 %indvars.iv126, 1
  br label %.lr.ph

.preheader83.preheader:                           ; preds = %._crit_edge99
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %40, i8 0, i64 32000000, i32 8, i1 false)
  %41 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %42 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.preheader83

.preheader83:                                     ; preds = %.preheader83.preheader, %64
  %.07392 = phi i32 [ %65, %64 ], [ 0, %.preheader83.preheader ]
  %43 = sext i32 %.07392 to i64
  br label %.preheader82

.preheader82:                                     ; preds = %.preheader83, %61
  %.17791 = phi i32 [ 0, %.preheader83 ], [ %62, %61 ]
  %44 = sext i32 %.17791 to i64
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %43
  br label %46

; <label>:46:                                     ; preds = %46, %.preheader82
  %indvars.iv104 = phi i64 [ 0, %.preheader82 ], [ %indvars.iv.next105.1, %46 ]
  %47 = load double, double* %45, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %43
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %44, i64 %indvars.iv104
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %54 = load double, double* %45, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next105, i64 %43
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %44, i64 %indvars.iv.next105
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond106.1 = icmp eq i64 %indvars.iv.next105.1, 2000
  br i1 %exitcond106.1, label %61, label %46

; <label>:61:                                     ; preds = %46
  %62 = add nsw i32 %.17791, 1
  %63 = icmp slt i32 %62, 2000
  br i1 %63, label %.preheader82, label %64

; <label>:64:                                     ; preds = %61
  %65 = add nsw i32 %.07392, 1
  %66 = icmp slt i32 %65, 2000
  br i1 %66, label %.preheader83, label %.preheader.preheader

.preheader.preheader:                             ; preds = %64
  %67 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %68 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %69 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %70 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %71 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %99
  %indvar = phi i64 [ %indvar.next, %99 ], [ 0, %.preheader.preheader ]
  %.27889 = phi i64 [ %100, %99 ], [ 0, %.preheader.preheader ]
  %sext = shl i64 %.27889, 32
  %72 = ashr exact i64 %sext, 32
  br label %73

; <label>:73:                                     ; preds = %73, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %73 ]
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %72, i64 %indvars.iv
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %72, i64 %indvars.iv
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %72, i64 %indvars.iv.next
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %72, i64 %indvars.iv.next
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %72, i64 %indvars.iv.next.1
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %72, i64 %indvars.iv.next.1
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %72, i64 %indvars.iv.next.2
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %72, i64 %indvars.iv.next.2
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %72, i64 %indvars.iv.next.3
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %72, i64 %indvars.iv.next.3
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %99, label %73

; <label>:99:                                     ; preds = %73
  %100 = add nsw i64 %72, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond103 = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond103, label %101, label %.preheader

; <label>:101:                                    ; preds = %99
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]*, double*, double*, double*) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge121, %4
  %indvars.iv144 = phi i64 [ 0, %4 ], [ %indvars.iv.next145, %._crit_edge121 ]
  %5 = icmp sgt i64 %indvars.iv144, 0
  br i1 %5, label %.lr.ph112.preheader, label %._crit_edge121

.lr.ph112.preheader:                              ; preds = %.preheader95
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 0
  br label %.lr.ph112

.lr.ph120:                                        ; preds = %._crit_edge109
  %7 = icmp sgt i64 %indvars.iv144, 0
  br i1 %7, label %.lr.ph120.split.us.preheader, label %._crit_edge121

.lr.ph120.split.us.preheader:                     ; preds = %.lr.ph120
  %8 = trunc i64 %indvars.iv144 to i32
  %xtraiter10 = and i64 %indvars.iv144, 1
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 0
  %10 = icmp eq i64 %xtraiter10, 0
  %11 = icmp eq i64 %indvars.iv144, 1
  br label %.lr.ph120.split.us

.lr.ph120.split.us:                               ; preds = %.lr.ph120.split.us.preheader, %._crit_edge117.us
  %.187119.us = phi i32 [ %32, %._crit_edge117.us ], [ %8, %.lr.ph120.split.us.preheader ]
  %12 = sext i32 %.187119.us to i64
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %12
  %14 = load double, double* %13, align 8
  br i1 %10, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph120.split.us
  %15 = load double, double* %9, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %12
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %14, %18
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph120.split.us
  %indvars.iv138.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph120.split.us ]
  %.1114.us.unr.ph = phi double [ %19, %.prol.preheader ], [ %14, %.lr.ph120.split.us ]
  %.lcssa127.unr.ph = phi double [ %19, %.prol.preheader ], [ undef, %.lr.ph120.split.us ]
  br i1 %11, label %._crit_edge117.us, label %.lr.ph120.split.us.new.preheader

.lr.ph120.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph120.split.us.new

.lr.ph120.split.us.new:                           ; preds = %.lr.ph120.split.us.new.preheader, %.lr.ph120.split.us.new
  %indvars.iv138 = phi i64 [ %indvars.iv.next139.1, %.lr.ph120.split.us.new ], [ %indvars.iv138.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %.1114.us = phi double [ %31, %.lr.ph120.split.us.new ], [ %.1114.us.unr.ph, %.lr.ph120.split.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv138
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv138, i64 %12
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %.1114.us, %24
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv.next139
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next139, i64 %12
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %exitcond143.1 = icmp eq i64 %indvars.iv.next139.1, %indvars.iv144
  br i1 %exitcond143.1, label %._crit_edge117.us.loopexit, label %.lr.ph120.split.us.new

._crit_edge117.us.loopexit:                       ; preds = %.lr.ph120.split.us.new
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %.prol.loopexit
  %.lcssa127 = phi double [ %.lcssa127.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge117.us.loopexit ]
  store double %.lcssa127, double* %13, align 8
  %32 = add nsw i32 %.187119.us, 1
  %33 = icmp slt i32 %32, 2000
  br i1 %33, label %.lr.ph120.split.us, label %._crit_edge121.loopexit

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge109
  %indvar6 = phi i32 [ %indvar.next7, %._crit_edge109 ], [ 0, %.lr.ph112.preheader ]
  %.086111 = phi i32 [ %60, %._crit_edge109 ], [ 0, %.lr.ph112.preheader ]
  %34 = sext i32 %.086111 to i64
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %34
  %36 = load double, double* %35, align 8
  %37 = icmp sgt i32 %.086111, 0
  br i1 %37, label %.lr.ph108.preheader, label %._crit_edge109

.lr.ph108.preheader:                              ; preds = %.lr.ph112
  %38 = and i32 %indvar6, 1
  %lcmp.mod9 = icmp eq i32 %38, 0
  br i1 %lcmp.mod9, label %.lr.ph108.prol.loopexit, label %.lr.ph108.prol

.lr.ph108.prol:                                   ; preds = %.lr.ph108.preheader
  %39 = load double, double* %6, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %34
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %36, %42
  br label %.lr.ph108.prol.loopexit

.lr.ph108.prol.loopexit:                          ; preds = %.lr.ph108.prol, %.lr.ph108.preheader
  %indvars.iv133.unr.ph = phi i64 [ 1, %.lr.ph108.prol ], [ 0, %.lr.ph108.preheader ]
  %.0106.unr.ph = phi double [ %43, %.lr.ph108.prol ], [ %36, %.lr.ph108.preheader ]
  %.lcssa126.unr.ph = phi double [ %43, %.lr.ph108.prol ], [ undef, %.lr.ph108.preheader ]
  %44 = icmp eq i32 %indvar6, 1
  br i1 %44, label %._crit_edge109, label %.lr.ph108.preheader14

.lr.ph108.preheader14:                            ; preds = %.lr.ph108.prol.loopexit
  %wide.trip.count135.1 = zext i32 %.086111 to i64
  br label %.lr.ph108

.lr.ph108:                                        ; preds = %.lr.ph108.preheader14, %.lr.ph108
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.1, %.lr.ph108 ], [ %indvars.iv133.unr.ph, %.lr.ph108.preheader14 ]
  %.0106 = phi double [ %56, %.lr.ph108 ], [ %.0106.unr.ph, %.lr.ph108.preheader14 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv133
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv133, i64 %34
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %.0106, %49
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv144, i64 %indvars.iv.next134
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next134, i64 %34
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %exitcond136.1 = icmp eq i64 %indvars.iv.next134.1, %wide.trip.count135.1
  br i1 %exitcond136.1, label %._crit_edge109.loopexit, label %.lr.ph108

._crit_edge109.loopexit:                          ; preds = %.lr.ph108
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %.lr.ph108.prol.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %36, %.lr.ph112 ], [ %.lcssa126.unr.ph, %.lr.ph108.prol.loopexit ], [ %56, %._crit_edge109.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %34, i64 %34
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %35, align 8
  %60 = add nsw i32 %.086111, 1
  %61 = sext i32 %60 to i64
  %62 = icmp slt i64 %61, %indvars.iv144
  %indvar.next7 = add i32 %indvar6, 1
  br i1 %62, label %.lr.ph112, label %.lr.ph120

._crit_edge121.loopexit:                          ; preds = %._crit_edge117.us
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader95, %.lr.ph120
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next145, 2000
  br i1 %exitcond146, label %.preheader93.preheader, label %.preheader95

.preheader93.preheader:                           ; preds = %._crit_edge121
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge102
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge102 ], [ 0, %.preheader93.preheader ]
  %.191104 = phi i32 [ %100, %._crit_edge102 ], [ 0, %.preheader93.preheader ]
  %63 = add i64 %indvar1, -1
  %64 = sext i32 %.191104 to i64
  %65 = getelementptr inbounds double, double* %1, i64 %64
  %66 = load double, double* %65, align 8
  %67 = icmp sgt i32 %.191104, 0
  br i1 %67, label %.lr.ph101.preheader, label %._crit_edge102

.lr.ph101.preheader:                              ; preds = %.preheader93
  %xtraiter3 = and i64 %indvar1, 3
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %.lr.ph101.prol.loopexit, label %.lr.ph101.prol.preheader

.lr.ph101.prol.preheader:                         ; preds = %.lr.ph101.preheader
  br label %.lr.ph101.prol

.lr.ph101.prol:                                   ; preds = %.lr.ph101.prol.preheader, %.lr.ph101.prol
  %indvars.iv130.prol = phi i64 [ %indvars.iv.next131.prol, %.lr.ph101.prol ], [ 0, %.lr.ph101.prol.preheader ]
  %.299.prol = phi double [ %73, %.lr.ph101.prol ], [ %66, %.lr.ph101.prol.preheader ]
  %prol.iter5 = phi i64 [ %prol.iter5.sub, %.lr.ph101.prol ], [ %xtraiter3, %.lr.ph101.prol.preheader ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %64, i64 %indvars.iv130.prol
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %3, i64 %indvars.iv130.prol
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %.299.prol, %72
  %indvars.iv.next131.prol = add nuw nsw i64 %indvars.iv130.prol, 1
  %prol.iter5.sub = add i64 %prol.iter5, -1
  %prol.iter5.cmp = icmp eq i64 %prol.iter5.sub, 0
  br i1 %prol.iter5.cmp, label %.lr.ph101.prol.loopexit.loopexit, label %.lr.ph101.prol, !llvm.loop !1

.lr.ph101.prol.loopexit.loopexit:                 ; preds = %.lr.ph101.prol
  br label %.lr.ph101.prol.loopexit

.lr.ph101.prol.loopexit:                          ; preds = %.lr.ph101.prol.loopexit.loopexit, %.lr.ph101.preheader
  %indvars.iv130.unr = phi i64 [ 0, %.lr.ph101.preheader ], [ %indvars.iv.next131.prol, %.lr.ph101.prol.loopexit.loopexit ]
  %.299.unr = phi double [ %66, %.lr.ph101.preheader ], [ %73, %.lr.ph101.prol.loopexit.loopexit ]
  %.lcssa125.unr = phi double [ undef, %.lr.ph101.preheader ], [ %73, %.lr.ph101.prol.loopexit.loopexit ]
  %74 = icmp ult i64 %63, 3
  br i1 %74, label %._crit_edge102, label %.lr.ph101.preheader13

.lr.ph101.preheader13:                            ; preds = %.lr.ph101.prol.loopexit
  %wide.trip.count.3 = zext i32 %.191104 to i64
  br label %.lr.ph101

.lr.ph101:                                        ; preds = %.lr.ph101.preheader13, %.lr.ph101
  %indvars.iv130 = phi i64 [ %indvars.iv.next131.3, %.lr.ph101 ], [ %indvars.iv130.unr, %.lr.ph101.preheader13 ]
  %.299 = phi double [ %98, %.lr.ph101 ], [ %.299.unr, %.lr.ph101.preheader13 ]
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %64, i64 %indvars.iv130
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %3, i64 %indvars.iv130
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fsub double %.299, %79
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %64, i64 %indvars.iv.next131
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next131
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fsub double %80, %85
  %indvars.iv.next131.1 = add nsw i64 %indvars.iv130, 2
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %64, i64 %indvars.iv.next131.1
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next131.1
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fsub double %86, %91
  %indvars.iv.next131.2 = add nsw i64 %indvars.iv130, 3
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %64, i64 %indvars.iv.next131.2
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next131.2
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %92, %97
  %indvars.iv.next131.3 = add nsw i64 %indvars.iv130, 4
  %exitcond132.3 = icmp eq i64 %indvars.iv.next131.3, %wide.trip.count.3
  br i1 %exitcond132.3, label %._crit_edge102.loopexit, label %.lr.ph101

._crit_edge102.loopexit:                          ; preds = %.lr.ph101
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102.loopexit, %.lr.ph101.prol.loopexit, %.preheader93
  %.2.lcssa = phi double [ %66, %.preheader93 ], [ %.lcssa125.unr, %.lr.ph101.prol.loopexit ], [ %98, %._crit_edge102.loopexit ]
  %99 = getelementptr inbounds double, double* %3, i64 %64
  store double %.2.lcssa, double* %99, align 8
  %100 = add nsw i32 %.191104, 1
  %101 = icmp slt i32 %100, 2000
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %101, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge102
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 2000, %.preheader.preheader ]
  %.29297 = phi i32 [ %.292, %._crit_edge ], [ 1999, %.preheader.preheader ]
  %102 = add i64 %indvar, -1
  %103 = sext i32 %.29297 to i64
  %104 = getelementptr inbounds double, double* %3, i64 %103
  %105 = load double, double* %104, align 8
  %106 = add nuw nsw i32 %.29297, 1
  %107 = icmp slt i32 %106, 2000
  br i1 %107, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.prol.preheader ]
  %.396.prol = phi double [ %113, %.lr.ph.prol ], [ %105, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv128.prol
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds double, double* %2, i64 %indvars.iv128.prol
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fsub double %.396.prol, %112
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !3

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv128.unr = phi i64 [ %indvars.iv, %.lr.ph.preheader ], [ %indvars.iv.next129.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.396.unr = phi double [ %105, %.lr.ph.preheader ], [ %113, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %113, %.lr.ph.prol.loopexit.loopexit ]
  %114 = icmp ult i64 %102, 3
  br i1 %114, label %._crit_edge, label %.lr.ph.preheader26

.lr.ph.preheader26:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader26, %.lr.ph
  %indvars.iv128 = phi i64 [ %indvars.iv.next129.3, %.lr.ph ], [ %indvars.iv128.unr, %.lr.ph.preheader26 ]
  %.396 = phi double [ %138, %.lr.ph ], [ %.396.unr, %.lr.ph.preheader26 ]
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv128
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %2, i64 %indvars.iv128
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fsub double %.396, %119
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv.next129
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next129
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fsub double %120, %125
  %indvars.iv.next129.1 = add nsw i64 %indvars.iv128, 2
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv.next129.1
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next129.1
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fsub double %126, %131
  %indvars.iv.next129.2 = add nsw i64 %indvars.iv128, 3
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv.next129.2
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next129.2
  %136 = load double, double* %135, align 8
  %137 = fmul double %134, %136
  %138 = fsub double %132, %137
  %indvars.iv.next129.3 = add nsw i64 %indvars.iv128, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next129.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %.3.lcssa = phi double [ %105, %.preheader ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %138, %._crit_edge.loopexit ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %103
  %140 = load double, double* %139, align 8
  %141 = fdiv double %.3.lcssa, %140
  %142 = getelementptr inbounds double, double* %2, i64 %103
  store double %141, double* %142, align 8
  %.292 = add nsw i32 %.29297, -1
  %143 = icmp sgt i32 %.29297, 0
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add i64 %indvar, 1
  br i1 %143, label %.preheader, label %144

; <label>:144:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
