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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #0 {
.lr.ph104.preheader:
  br label %.lr.ph104

.lr.ph104:                                        ; preds = %.lr.ph104, %.lr.ph104.preheader
  %indvars.iv140 = phi i64 [ 0, %.lr.ph104.preheader ], [ %indvars.iv.next141.1, %.lr.ph104 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  store double 0.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next141 = or i64 %indvars.iv140, 1
  %7 = trunc i64 %indvars.iv.next141 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv140
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next141
  store double 0.000000e+00, double* %13, align 8
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %15 = trunc i64 %indvars.iv.next141.1 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = fadd double %18, 4.000000e+00
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next141
  store double %19, double* %20, align 8
  %exitcond142.1 = icmp eq i64 %indvars.iv.next141.1, 2000
  br i1 %exitcond142.1, label %.lr.ph95.preheader, label %.lr.ph104

.lr.ph95.preheader:                               ; preds = %.lr.ph104
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %.lr.ph95.preheader, %.lr.ph95.backedge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %.lr.ph95.backedge ], [ 0, %.lr.ph95.preheader ]
  %indvars.iv135 = phi i64 [ %indvars.iv135.be, %.lr.ph95.backedge ], [ 1, %.lr.ph95.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv137, 2001
  %22 = add nuw nsw i64 %21, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %22
  %scevgep134 = bitcast double* %scevgep to i8*
  %23 = sub i64 1998, %indvars.iv137
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

.preheader71:                                     ; preds = %28
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %27 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %27, label %._crit_edge99.thread, label %._crit_edge99

; <label>:28:                                     ; preds = %28, %.lr.ph95
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %28 ], [ 0, %.lr.ph95 ]
  %29 = sub nsw i64 0, %indvars.iv124
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv124
  store double %34, double* %35, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next125, %indvars.iv135
  br i1 %exitcond128, label %.preheader71, label %28

._crit_edge99.thread:                             ; preds = %.preheader71
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep134, i8 0, i64 %26, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph95.backedge

._crit_edge99:                                    ; preds = %.preheader71
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  %exitcond139 = icmp eq i64 %indvars.iv.next138, 2000
  br i1 %exitcond139, label %.preheader68.lr.ph, label %.lr.ph95.backedge

.lr.ph95.backedge:                                ; preds = %._crit_edge99, %._crit_edge99.thread
  %indvars.iv135.be = add nuw nsw i64 %indvars.iv135, 1
  br label %.lr.ph95

.preheader68.lr.ph:                               ; preds = %._crit_edge99
  %38 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %38, i8 0, i64 32000000, i32 8, i1 false)
  %39 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader68.lr.ph, %._crit_edge81.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge81.us ], [ 0, %.preheader68.lr.ph ]
  br label %.preheader67.us.us

._crit_edge81.us:                                 ; preds = %._crit_edge79.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond117, label %.preheader.lr.ph, label %.preheader67.us.us.preheader

.preheader67.us.us:                               ; preds = %._crit_edge79.us.us, %.preheader67.us.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next113, %._crit_edge79.us.us ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv115
  br label %41

._crit_edge79.us.us:                              ; preds = %41
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond114, label %._crit_edge81.us, label %.preheader67.us.us

; <label>:41:                                     ; preds = %41, %.preheader67.us.us
  %indvars.iv109 = phi i64 [ 0, %.preheader67.us.us ], [ %indvars.iv.next110.1, %41 ]
  %42 = load double, double* %40, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv115
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv112, i64 %indvars.iv109
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %49 = load double, double* %40, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next110, i64 %indvars.iv115
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next110
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond111.1, label %._crit_edge79.us.us, label %41

.preheader.lr.ph:                                 ; preds = %._crit_edge81.us
  %56 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.4, %57 ]
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %79 = bitcast double* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge.us, label %57

._crit_edge.us:                                   ; preds = %57
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond, label %._crit_edge76, label %.preheader.us

._crit_edge76:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %38) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) unnamed_addr #2 {
.preheader77.preheader:
  br label %.preheader77

.preheader77:                                     ; preds = %._crit_edge110, %.preheader77.preheader
  %indvars.iv167 = phi i64 [ 0, %.preheader77.preheader ], [ %indvars.iv.next168, %._crit_edge110 ]
  %5 = add i64 %indvars.iv167, 4294967295
  %6 = icmp sgt i64 %indvars.iv167, 0
  br i1 %6, label %.lr.ph102.preheader, label %._crit_edge110

.lr.ph102.preheader:                              ; preds = %.preheader77
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 0
  br label %.lr.ph102

.lr.ph109:                                        ; preds = %._crit_edge99
  %8 = icmp sgt i64 %indvars.iv167, 0
  br i1 %8, label %.lr.ph109.split.us.preheader, label %._crit_edge110

.lr.ph109.split.us.preheader:                     ; preds = %.lr.ph109
  %xtraiter157170 = and i64 %indvars.iv167, 1
  %lcmp.mod158 = icmp eq i64 %xtraiter157170, 0
  %9 = trunc i64 %5 to i32
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 0
  br label %.lr.ph109.split.us

.lr.ph109.split.us:                               ; preds = %.lr.ph109.split.us.preheader, %._crit_edge106.us
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge106.us ], [ %indvars.iv167, %.lr.ph109.split.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv162
  %13 = load double, double* %12, align 8
  br i1 %lcmp.mod158, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph109.split.us
  %14 = load double, double* %11, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv162
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %13, %17
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph109.split.us
  %indvars.iv152.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph109.split.us ]
  %.unr159.ph = phi double [ %18, %.prol.preheader ], [ %13, %.lr.ph109.split.us ]
  %.lcssa118.unr.ph = phi double [ %18, %.prol.preheader ], [ undef, %.lr.ph109.split.us ]
  br i1 %10, label %._crit_edge106.us, label %.lr.ph109.split.us.new.preheader

.lr.ph109.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph109.split.us.new

.lr.ph109.split.us.new:                           ; preds = %.lr.ph109.split.us.new.preheader, %.lr.ph109.split.us.new
  %indvars.iv152 = phi i64 [ %indvars.iv.next153.1, %.lr.ph109.split.us.new ], [ %indvars.iv152.unr.ph, %.lr.ph109.split.us.new.preheader ]
  %19 = phi double [ %31, %.lr.ph109.split.us.new ], [ %.unr159.ph, %.lr.ph109.split.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv152
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv152, i64 %indvars.iv162
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv.next153
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next153, i64 %indvars.iv162
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  %exitcond156.1 = icmp eq i64 %indvars.iv.next153.1, %indvars.iv167
  br i1 %exitcond156.1, label %._crit_edge106.us.loopexit, label %.lr.ph109.split.us.new

._crit_edge106.us.loopexit:                       ; preds = %.lr.ph109.split.us.new
  br label %._crit_edge106.us

._crit_edge106.us:                                ; preds = %._crit_edge106.us.loopexit, %.prol.loopexit
  %.lcssa118 = phi double [ %.lcssa118.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge106.us.loopexit ]
  store double %.lcssa118, double* %12, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next163, 2000
  br i1 %exitcond164, label %._crit_edge110.loopexit, label %.lr.ph109.split.us

.lr.ph102:                                        ; preds = %.lr.ph102.preheader, %._crit_edge99
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge99 ], [ 0, %.lr.ph102.preheader ]
  %32 = add i64 %indvars.iv145, 4294967295
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv145
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = bitcast i64 %35 to double
  %37 = icmp sgt i64 %indvars.iv145, 0
  br i1 %37, label %.lr.ph98.preheader, label %._crit_edge99

.lr.ph98.preheader:                               ; preds = %.lr.ph102
  %xtraiter141171 = and i64 %indvars.iv145, 1
  %lcmp.mod142 = icmp eq i64 %xtraiter141171, 0
  br i1 %lcmp.mod142, label %.lr.ph98.prol.loopexit, label %.lr.ph98.prol

.lr.ph98.prol:                                    ; preds = %.lr.ph98.preheader
  %38 = load double, double* %7, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv145
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = bitcast i64 %35 to double
  %43 = fsub double %42, %41
  %44 = bitcast double %43 to i64
  br label %.lr.ph98.prol.loopexit

.lr.ph98.prol.loopexit:                           ; preds = %.lr.ph98.prol, %.lr.ph98.preheader
  %indvars.iv136.unr.ph = phi i64 [ 1, %.lr.ph98.prol ], [ 0, %.lr.ph98.preheader ]
  %.sroa.0.095.unr.ph = phi i64 [ %44, %.lr.ph98.prol ], [ %35, %.lr.ph98.preheader ]
  %.lcssa117.unr.ph = phi double [ %43, %.lr.ph98.prol ], [ undef, %.lr.ph98.preheader ]
  %45 = trunc i64 %32 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge99, label %.lr.ph98.preheader190

.lr.ph98.preheader190:                            ; preds = %.lr.ph98.prol.loopexit
  br label %.lr.ph98

.lr.ph98:                                         ; preds = %.lr.ph98.preheader190, %.lr.ph98
  %indvars.iv136 = phi i64 [ %indvars.iv.next137.1, %.lr.ph98 ], [ %indvars.iv136.unr.ph, %.lr.ph98.preheader190 ]
  %.sroa.0.095 = phi i64 [ %60, %.lr.ph98 ], [ %.sroa.0.095.unr.ph, %.lr.ph98.preheader190 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv136
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv145
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = bitcast i64 %.sroa.0.095 to double
  %53 = fsub double %52, %51
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv.next137
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next137, i64 %indvars.iv145
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fsub double %53, %58
  %60 = bitcast double %59 to i64
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %exitcond140.1 = icmp eq i64 %indvars.iv.next137.1, %indvars.iv145
  br i1 %exitcond140.1, label %._crit_edge99.loopexit, label %.lr.ph98

._crit_edge99.loopexit:                           ; preds = %.lr.ph98
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.loopexit, %.lr.ph98.prol.loopexit, %.lr.ph102
  %.lcssa79 = phi double [ %36, %.lr.ph102 ], [ %.lcssa117.unr.ph, %.lr.ph98.prol.loopexit ], [ %59, %._crit_edge99.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv145
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.lcssa79, %62
  store double %63, double* %33, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next146, %indvars.iv167
  br i1 %exitcond150, label %.lr.ph109, label %.lr.ph102

._crit_edge110.loopexit:                          ; preds = %._crit_edge106.us
  br label %._crit_edge110

._crit_edge110:                                   ; preds = %._crit_edge110.loopexit, %.preheader77, %.lr.ph109
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next168, 2000
  br i1 %exitcond169, label %.lr.ph94.preheader, label %.preheader77

.lr.ph94.preheader:                               ; preds = %._crit_edge110
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %.lr.ph94.preheader, %._crit_edge91
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge91 ], [ 0, %.lr.ph94.preheader ]
  %64 = add i64 %indvars.iv133, 4294967295
  %65 = getelementptr inbounds double, double* %2, i64 %indvars.iv133
  %66 = load double, double* %65, align 8
  %67 = icmp sgt i64 %indvars.iv133, 0
  br i1 %67, label %.lr.ph90.preheader, label %._crit_edge91

.lr.ph90.preheader:                               ; preds = %.lr.ph94
  %68 = trunc i64 %indvars.iv133 to i32
  %xtraiter129 = and i32 %68, 3
  %lcmp.mod130 = icmp eq i32 %xtraiter129, 0
  br i1 %lcmp.mod130, label %.lr.ph90.prol.loopexit, label %.lr.ph90.prol.preheader

.lr.ph90.prol.preheader:                          ; preds = %.lr.ph90.preheader
  br label %.lr.ph90.prol

.lr.ph90.prol:                                    ; preds = %.lr.ph90.prol.preheader, %.lr.ph90.prol
  %indvars.iv124.prol = phi i64 [ %indvars.iv.next125.prol, %.lr.ph90.prol ], [ 0, %.lr.ph90.prol.preheader ]
  %69 = phi double [ %75, %.lr.ph90.prol ], [ %66, %.lr.ph90.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph90.prol ], [ %xtraiter129, %.lr.ph90.prol.preheader ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv124.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %4, i64 %indvars.iv124.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %69, %74
  %indvars.iv.next125.prol = add nuw nsw i64 %indvars.iv124.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph90.prol.loopexit.loopexit, label %.lr.ph90.prol, !llvm.loop !1

.lr.ph90.prol.loopexit.loopexit:                  ; preds = %.lr.ph90.prol
  br label %.lr.ph90.prol.loopexit

.lr.ph90.prol.loopexit:                           ; preds = %.lr.ph90.prol.loopexit.loopexit, %.lr.ph90.preheader
  %indvars.iv124.unr = phi i64 [ 0, %.lr.ph90.preheader ], [ %indvars.iv.next125.prol, %.lr.ph90.prol.loopexit.loopexit ]
  %.unr = phi double [ %66, %.lr.ph90.preheader ], [ %75, %.lr.ph90.prol.loopexit.loopexit ]
  %.lcssa116.unr = phi double [ undef, %.lr.ph90.preheader ], [ %75, %.lr.ph90.prol.loopexit.loopexit ]
  %76 = trunc i64 %64 to i32
  %77 = icmp ult i32 %76, 3
  br i1 %77, label %._crit_edge91, label %.lr.ph90.preheader189

.lr.ph90.preheader189:                            ; preds = %.lr.ph90.prol.loopexit
  br label %.lr.ph90

.lr.ph90:                                         ; preds = %.lr.ph90.preheader189, %.lr.ph90
  %indvars.iv124 = phi i64 [ %indvars.iv.next125.3, %.lr.ph90 ], [ %indvars.iv124.unr, %.lr.ph90.preheader189 ]
  %78 = phi double [ %102, %.lr.ph90 ], [ %.unr, %.lr.ph90.preheader189 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv124
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv124
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fsub double %78, %83
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv.next125
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next125
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fsub double %84, %89
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv.next125.1
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next125.1
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %90, %95
  %indvars.iv.next125.2 = add nsw i64 %indvars.iv124, 3
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv.next125.2
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next125.2
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fsub double %96, %101
  %indvars.iv.next125.3 = add nsw i64 %indvars.iv124, 4
  %exitcond128.3 = icmp eq i64 %indvars.iv.next125.3, %indvars.iv133
  br i1 %exitcond128.3, label %._crit_edge91.loopexit, label %.lr.ph90

._crit_edge91.loopexit:                           ; preds = %.lr.ph90
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %.lr.ph90.prol.loopexit, %.lr.ph94
  %.lcssa78 = phi double [ %66, %.lr.ph94 ], [ %.lcssa116.unr, %.lr.ph90.prol.loopexit ], [ %102, %._crit_edge91.loopexit ]
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv133
  store double %.lcssa78, double* %103, align 8
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 2000
  br i1 %exitcond135, label %.lr.ph86.preheader, label %.lr.ph94

.lr.ph86.preheader:                               ; preds = %._crit_edge91
  br label %.lr.ph86

.lr.ph86:                                         ; preds = %.lr.ph86.preheader, %._crit_edge
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge ], [ 1999, %.lr.ph86.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph86.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 2000, %.lr.ph86.preheader ]
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv121
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = bitcast i64 %106 to double
  %108 = add nuw nsw i64 %indvars.iv121, 1
  %109 = icmp slt i64 %108, 2000
  br i1 %109, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph86
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = bitcast i64 %106 to double
  %116 = fsub double %115, %114
  %117 = bitcast double %116 to i64
  %indvars.iv.next120.prol = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv119.unr.ph = phi i64 [ %indvars.iv.next120.prol, %.lr.ph.prol ], [ %indvars.iv, %.lr.ph.preheader ]
  %.sroa.0.382.unr.ph = phi i64 [ %117, %.lr.ph.prol ], [ %106, %.lr.ph.preheader ]
  %.lcssa115.unr.ph = phi double [ %116, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %118 = icmp eq i32 %indvar, 1
  br i1 %118, label %._crit_edge, label %.lr.ph.preheader188

.lr.ph.preheader188:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader188, %.lr.ph
  %indvars.iv119 = phi i64 [ %indvars.iv.next120.1, %.lr.ph ], [ %indvars.iv119.unr.ph, %.lr.ph.preheader188 ]
  %.sroa.0.382 = phi i64 [ %132, %.lr.ph ], [ %.sroa.0.382.unr.ph, %.lr.ph.preheader188 ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv119
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %3, i64 %indvars.iv119
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = bitcast i64 %.sroa.0.382 to double
  %125 = fsub double %124, %123
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next120
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next120
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fsub double %125, %130
  %132 = bitcast double %131 to i64
  %indvars.iv.next120.1 = add nsw i64 %indvars.iv119, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next120.1, 2000
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph86
  %.lcssa = phi double [ %107, %.lr.ph86 ], [ %.lcssa115.unr.ph, %.lr.ph.prol.loopexit ], [ %131, %._crit_edge.loopexit ]
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv121
  %134 = load double, double* %133, align 8
  %135 = fdiv double %.lcssa, %134
  %136 = getelementptr inbounds double, double* %3, i64 %indvars.iv121
  store double %135, double* %136, align 8
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, -1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge87, label %.lr.ph86

._crit_edge87:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %11, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %11 ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %9, %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
