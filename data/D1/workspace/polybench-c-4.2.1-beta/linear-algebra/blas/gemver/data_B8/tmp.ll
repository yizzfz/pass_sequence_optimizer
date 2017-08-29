; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call void @print_array(i32 2000, double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph45.split.us.preheader, label %._crit_edge

.lr.ph45.split.us.preheader:                      ; preds = %12
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %0, 1
  %wide.trip.count48 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %16 = fdiv double 0.000000e+00, %13
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %..loopexit_crit_edge.us, %.lr.ph45.split.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.lr.ph45.split.us.preheader ], [ %indvars.iv.next47, %..loopexit_crit_edge.us ]
  %17 = trunc i64 %indvars.iv46 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv46
  store double %18, double* %19, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %20 = trunc i64 %indvars.iv.next47 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = fmul double %22, 5.000000e-01
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv46
  store double %23, double* %24, align 8
  %25 = fmul double %22, 2.500000e-01
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv46
  store double %25, double* %26, align 8
  %27 = fdiv double %22, 6.000000e+00
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv46
  store double %27, double* %28, align 8
  %29 = fmul double %22, 1.250000e-01
  %30 = getelementptr inbounds double, double* %10, i64 %indvars.iv46
  store double %29, double* %30, align 8
  %31 = fdiv double %22, 9.000000e+00
  %32 = getelementptr inbounds double, double* %11, i64 %indvars.iv46
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %9, i64 %indvars.iv46
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv46
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph45.split.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 0
  store double %16, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph45.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph45.split.us ]
  br i1 %15, label %..loopexit_crit_edge.us, label %.lr.ph45.split.us.new.preheader

.lr.ph45.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph45.split.us.new

.lr.ph45.split.us.new:                            ; preds = %.lr.ph45.split.us.new.preheader, %.lr.ph45.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph45.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph45.split.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv46
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %0
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %13
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv46
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %13
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv46, i64 %indvars.iv.next
  store double %46, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph45.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph45.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph45.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader67.us.preheader, label %._crit_edge70

.preheader67.us.preheader:                        ; preds = %12
  %xtraiter108 = and i32 %0, 1
  %lcmp.mod109 = icmp eq i32 %xtraiter108, 0
  %14 = icmp eq i32 %0, 1
  %wide.trip.count112 = zext i32 %0 to i64
  %wide.trip.count104.1 = zext i32 %0 to i64
  br label %.preheader67.us

.preheader67.us:                                  ; preds = %._crit_edge79.us, %.preheader67.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.preheader67.us.preheader ], [ %indvars.iv.next111, %._crit_edge79.us ]
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv110
  %16 = getelementptr inbounds double, double* %6, i64 %indvars.iv110
  br i1 %lcmp.mod109, label %.prol.loopexit107, label %.prol.preheader106

.prol.preheader106:                               ; preds = %.preheader67.us
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv110, i64 0
  %18 = load double, double* %17, align 8
  %19 = load double, double* %15, align 8
  %20 = load double, double* %5, align 8
  %21 = fmul double %19, %20
  %22 = fadd double %18, %21
  %23 = load double, double* %16, align 8
  %24 = load double, double* %7, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %22, %25
  store double %26, double* %17, align 8
  br label %.prol.loopexit107

.prol.loopexit107:                                ; preds = %.preheader67.us, %.prol.preheader106
  %indvars.iv102.unr.ph = phi i64 [ 1, %.prol.preheader106 ], [ 0, %.preheader67.us ]
  br i1 %14, label %._crit_edge79.us, label %.preheader67.us.new.preheader

.preheader67.us.new.preheader:                    ; preds = %.prol.loopexit107
  br label %.preheader67.us.new

.preheader67.us.new:                              ; preds = %.preheader67.us.new.preheader, %.preheader67.us.new
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %.preheader67.us.new ], [ %indvars.iv102.unr.ph, %.preheader67.us.new.preheader ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv102
  %28 = load double, double* %27, align 8
  %29 = load double, double* %15, align 8
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv102
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %28, %32
  %34 = load double, double* %16, align 8
  %35 = getelementptr inbounds double, double* %7, i64 %indvars.iv102
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %33, %37
  store double %38, double* %27, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv.next103
  %40 = load double, double* %39, align 8
  %41 = load double, double* %15, align 8
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next103
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %40, %44
  %46 = load double, double* %16, align 8
  %47 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next103
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %45, %49
  store double %50, double* %39, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103.1, %wide.trip.count104.1
  br i1 %exitcond105.1, label %._crit_edge79.us.loopexit, label %.preheader67.us.new

._crit_edge79.us.loopexit:                        ; preds = %.preheader67.us.new
  br label %._crit_edge79.us

._crit_edge79.us:                                 ; preds = %._crit_edge79.us.loopexit, %.prol.loopexit107
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, %wide.trip.count112
  br i1 %exitcond113, label %.preheader66, label %.preheader67.us

.preheader66:                                     ; preds = %._crit_edge79.us
  %51 = icmp sgt i32 %0, 0
  br i1 %51, label %.preheader65.us.preheader, label %._crit_edge70

.preheader65.us.preheader:                        ; preds = %.preheader66
  %xtraiter96 = and i32 %0, 1
  %lcmp.mod97 = icmp eq i32 %xtraiter96, 0
  %52 = icmp eq i32 %0, 1
  %wide.trip.count100 = zext i32 %0 to i64
  %wide.trip.count92.1 = zext i32 %0 to i64
  br label %.preheader65.us

.preheader65.us:                                  ; preds = %._crit_edge75.us, %.preheader65.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.preheader65.us.preheader ], [ %indvars.iv.next99, %._crit_edge75.us ]
  %53 = getelementptr inbounds double, double* %9, i64 %indvars.iv98
  br i1 %lcmp.mod97, label %.prol.loopexit95, label %.prol.preheader94

.prol.preheader94:                                ; preds = %.preheader65.us
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv98
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %10, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %54, %59
  store double %60, double* %53, align 8
  br label %.prol.loopexit95

.prol.loopexit95:                                 ; preds = %.preheader65.us, %.prol.preheader94
  %indvars.iv90.unr.ph = phi i64 [ 1, %.prol.preheader94 ], [ 0, %.preheader65.us ]
  br i1 %52, label %._crit_edge75.us, label %.preheader65.us.new.preheader

.preheader65.us.new.preheader:                    ; preds = %.prol.loopexit95
  br label %.preheader65.us.new

.preheader65.us.new:                              ; preds = %.preheader65.us.new.preheader, %.preheader65.us.new
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.preheader65.us.new ], [ %indvars.iv90.unr.ph, %.preheader65.us.new.preheader ]
  %61 = load double, double* %53, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv90, i64 %indvars.iv98
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %2
  %65 = getelementptr inbounds double, double* %10, i64 %indvars.iv90
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %61, %67
  store double %68, double* %53, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next91, i64 %indvars.iv98
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %2
  %72 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next91
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %68, %74
  store double %75, double* %53, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92.1
  br i1 %exitcond93.1, label %._crit_edge75.us.loopexit, label %.preheader65.us.new

._crit_edge75.us.loopexit:                        ; preds = %.preheader65.us.new
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us.loopexit, %.prol.loopexit95
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %.preheader64, label %.preheader65.us

.preheader64:                                     ; preds = %._crit_edge75.us
  %76 = icmp sgt i32 %0, 0
  br i1 %76, label %.lr.ph72.preheader, label %._crit_edge70

.lr.ph72.preheader:                               ; preds = %.preheader64
  %77 = add i32 %0, -1
  %xtraiter88 = and i32 %0, 3
  %lcmp.mod89 = icmp eq i32 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph72.prol.loopexit, label %.lr.ph72.prol.preheader

.lr.ph72.prol.preheader:                          ; preds = %.lr.ph72.preheader
  br label %.lr.ph72.prol

.lr.ph72.prol:                                    ; preds = %.lr.ph72.prol.preheader, %.lr.ph72.prol
  %indvars.iv84.prol = phi i64 [ %indvars.iv.next85.prol, %.lr.ph72.prol ], [ 0, %.lr.ph72.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph72.prol ], [ %xtraiter88, %.lr.ph72.prol.preheader ]
  %78 = getelementptr inbounds double, double* %9, i64 %indvars.iv84.prol
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds double, double* %11, i64 %indvars.iv84.prol
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  store double %82, double* %78, align 8
  %indvars.iv.next85.prol = add nuw nsw i64 %indvars.iv84.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph72.prol.loopexit.loopexit, label %.lr.ph72.prol, !llvm.loop !1

.lr.ph72.prol.loopexit.loopexit:                  ; preds = %.lr.ph72.prol
  br label %.lr.ph72.prol.loopexit

.lr.ph72.prol.loopexit:                           ; preds = %.lr.ph72.prol.loopexit.loopexit, %.lr.ph72.preheader
  %indvars.iv84.unr = phi i64 [ 0, %.lr.ph72.preheader ], [ %indvars.iv.next85.prol, %.lr.ph72.prol.loopexit.loopexit ]
  %83 = icmp ult i32 %77, 3
  br i1 %83, label %.preheader.us.preheader, label %.lr.ph72.preheader115

.lr.ph72.preheader115:                            ; preds = %.lr.ph72.prol.loopexit
  %wide.trip.count86.3 = zext i32 %0 to i64
  br label %.lr.ph72

.preheader63:                                     ; preds = %.lr.ph72
  %84 = icmp sgt i32 %0, 0
  br i1 %84, label %.preheader.us.preheader, label %._crit_edge70

.preheader.us.preheader:                          ; preds = %.preheader63, %.lr.ph72.prol.loopexit
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %85 = icmp eq i32 %0, 1
  %wide.trip.count83 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv81 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next82, %._crit_edge.us ]
  %86 = getelementptr inbounds double, double* %8, i64 %indvars.iv81
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv81, i64 0
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, %1
  %91 = load double, double* %9, align 8
  %92 = fmul double %90, %91
  %93 = fadd double %87, %92
  store double %93, double* %86, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %85, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %94 = load double, double* %86, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv81, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, %1
  %98 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fadd double %94, %100
  store double %101, double* %86, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv81, i64 %indvars.iv.next
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, %1
  %105 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fadd double %101, %107
  store double %108, double* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond, label %._crit_edge70.loopexit, label %.preheader.us

.lr.ph72:                                         ; preds = %.lr.ph72, %.lr.ph72.preheader115
  %indvars.iv84 = phi i64 [ %indvars.iv84.unr, %.lr.ph72.preheader115 ], [ %indvars.iv.next85.3, %.lr.ph72 ]
  %109 = getelementptr inbounds double, double* %9, i64 %indvars.iv84
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %11, i64 %indvars.iv84
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  store double %113, double* %109, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %114 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next85
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next85
  %117 = load double, double* %116, align 8
  %118 = fadd double %115, %117
  store double %118, double* %114, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %119 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next85.1
  %120 = load double, double* %119, align 8
  %121 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next85.1
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  store double %123, double* %119, align 8
  %indvars.iv.next85.2 = add nsw i64 %indvars.iv84, 3
  %124 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next85.2
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next85.2
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  store double %128, double* %124, align 8
  %indvars.iv.next85.3 = add nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, %wide.trip.count86.3
  br i1 %exitcond87.3, label %.preheader63, label %.lr.ph72

._crit_edge70.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %.preheader63, %.preheader64, %.preheader66, %12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
