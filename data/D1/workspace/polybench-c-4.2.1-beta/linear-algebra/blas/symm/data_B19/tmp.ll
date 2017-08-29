; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
.preheader40.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %.preheader40.us.preheader
  %indvars.iv73 = phi i64 [ 0, %.preheader40.us.preheader ], [ %indvars.iv.next74, %._crit_edge50.us ]
  %7 = add nuw nsw i64 %indvars.iv73, 1200
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78, %.preheader40.us
  %indvars.iv70 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next71, %._crit_edge78 ]
  %8 = add nuw nsw i64 %indvars.iv70, %indvars.iv73
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv73, i64 %indvars.iv70
  store double %12, double* %13, align 8
  %14 = sub nuw nsw i64 %7, %indvars.iv70
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv73, i64 %indvars.iv70
  store double %18, double* %19, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond72, label %._crit_edge50.us, label %._crit_edge78

._crit_edge50.us:                                 ; preds = %._crit_edge78
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond75, label %.lr.ph.preheader, label %.preheader40.us

.lr.ph.preheader:                                 ; preds = %._crit_edge50.us
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.prol.loopexit61, %._crit_edge
  %exitcond = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond, label %._crit_edge47, label %.loopexit..lr.ph_crit_edge

.loopexit..lr.ph_crit_edge:                       ; preds = %.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit..lr.ph_crit_edge
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.loopexit..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %.loopexit..lr.ph_crit_edge ], [ 1, %.lr.ph.preheader ]
  %20 = sub i64 999, %indvars.iv68
  %21 = sub i64 998, %indvars.iv68
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %xtraiter77 = and i64 %indvars.iv.next69, 1
  %lcmp.mod = icmp eq i64 %xtraiter77, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %22 = trunc i64 %indvars.iv68 to i32
  %23 = srem i32 %22, 100
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 0
  store double %25, double* %26, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %27 = icmp eq i64 %indvars.iv68, 0
  br i1 %27, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %28 = add nuw nsw i64 %indvars.iv, %indvars.iv68
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = add nuw nsw i64 %indvars.iv.next, %indvars.iv68
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.000000e+03
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next
  store double %38, double* %39, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv66
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %40 = icmp slt i64 %indvars.iv.next69, 1000
  br i1 %40, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %41 = trunc i64 %20 to i32
  %xtraiter62 = and i32 %41, 7
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60.preheader

.prol.preheader60.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader60

.prol.preheader60:                                ; preds = %.prol.preheader60.preheader, %.prol.preheader60
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader60 ], [ %indvars.iv66, %.prol.preheader60.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader60 ], [ %xtraiter62, %.prol.preheader60.preheader ]
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv58.prol
  store double -9.990000e+02, double* %42, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit61.loopexit, label %.prol.preheader60, !llvm.loop !1

.prol.loopexit61.loopexit:                        ; preds = %.prol.preheader60
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.loopexit61.loopexit, %.lr.ph44
  %indvars.iv58.unr = phi i64 [ %indvars.iv66, %.lr.ph44 ], [ %indvars.iv.next59.prol, %.prol.loopexit61.loopexit ]
  %43 = trunc i64 %21 to i32
  %44 = icmp ult i32 %43, 7
  br i1 %44, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit61
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader, %.lr.ph44.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.7, %.lr.ph44.new ], [ %indvars.iv58.unr, %.lr.ph44.new.preheader ]
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv58
  store double -9.990000e+02, double* %45, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59
  store double -9.990000e+02, double* %46, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.1
  store double -9.990000e+02, double* %47, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.2
  store double -9.990000e+02, double* %48, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.3
  store double -9.990000e+02, double* %49, align 8
  %indvars.iv.next59.4 = add nsw i64 %indvars.iv58, 5
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.4
  store double -9.990000e+02, double* %50, align 8
  %indvars.iv.next59.5 = add nsw i64 %indvars.iv58, 6
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.5
  store double -9.990000e+02, double* %51, align 8
  %indvars.iv.next59.6 = add nsw i64 %indvars.iv58, 7
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59.6
  store double -9.990000e+02, double* %52, align 8
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next59.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph44.new

._crit_edge47:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
.preheader44.us.preheader:
  %7 = fmul double %2, 0.000000e+00
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next81, %._crit_edge51.us ]
  %8 = icmp sgt i64 %indvars.iv80, 0
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv80, i64 %indvars.iv80
  br i1 %8, label %.preheader.us.us.preheader, label %.preheader.us61.preheader

.preheader.us61.preheader:                        ; preds = %.preheader44.us
  br label %.preheader.us61

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us61.preheader ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv80, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %2
  %16 = load double, double* %9, align 8
  %17 = fmul double %15, %16
  %18 = fadd double %12, %17
  %19 = fadd double %7, %18
  store double %19, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %3
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv80, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  %26 = load double, double* %9, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %22, %27
  %29 = fadd double %7, %28
  store double %29, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit85, label %.preheader.us61

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit85:                      ; preds = %.preheader.us61
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit85, %._crit_edge51.us.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next81, 1000
  br i1 %exitcond82, label %._crit_edge55, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv80, i64 %indvars.iv77
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv80, i64 %indvars.iv77
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv80, i64 %indvars.iv77
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = load double, double* %9, align 8
  %38 = fmul double %36, %37
  %39 = fadd double %33, %38
  %40 = fmul double %54, %2
  %41 = fadd double %40, %39
  store double %41, double* %31, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next78, 1200
  br i1 %exitcond79, label %._crit_edge51.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv72 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next73, %._crit_edge ]
  %.047.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %54, %._crit_edge ]
  %42 = load double, double* %30, align 8
  %43 = fmul double %42, %2
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv80, i64 %indvars.iv72
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv77
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv77
  %51 = load double, double* %50, align 8
  %52 = load double, double* %44, align 8
  %53 = fmul double %51, %52
  %54 = fadd double %.047.us.us, %53
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next73, %indvars.iv80
  br i1 %exitcond76, label %._crit_edge.us.us, label %._crit_edge

._crit_edge55:                                    ; preds = %._crit_edge51.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge19
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
