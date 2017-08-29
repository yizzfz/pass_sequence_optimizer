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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph50:
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %._crit_edge47..lr.ph41_crit_edge, %.lr.ph50
  %indvars.iv91 = phi i64 [ 0, %.lr.ph50 ], [ %indvars.iv.next92, %._crit_edge47..lr.ph41_crit_edge ]
  %indvars.iv89 = phi i64 [ 1, %.lr.ph50 ], [ %indvars.iv.next90, %._crit_edge47..lr.ph41_crit_edge ]
  br label %1

; <label>:1:                                      ; preds = %1, %.lr.ph41
  %indvars.iv73 = phi i64 [ 0, %.lr.ph41 ], [ %indvars.iv.next74, %1 ]
  %2 = sub nsw i64 0, %indvars.iv73
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 2000
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.000000e+03
  %7 = fadd double %6, 1.000000e+00
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv73
  store double %7, double* %8, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next74, %indvars.iv89
  br i1 %exitcond78, label %._crit_edge42, label %1

._crit_edge42:                                    ; preds = %1
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %9 = icmp slt i64 %indvars.iv.next92, 2000
  br i1 %9, label %.lr.ph46, label %._crit_edge47

.lr.ph46:                                         ; preds = %._crit_edge42
  %10 = mul nuw nsw i64 %indvars.iv91, 2001
  %11 = sub i64 1998, %indvars.iv91
  %12 = shl i64 %11, 3
  %13 = and i64 %12, 34359738360
  %14 = add nuw nsw i64 %13, 8
  %15 = add nuw nsw i64 %10, 1
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %15
  %16 = bitcast double* %scevgep87 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge42, %.lr.ph46
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv91
  store double 1.000000e+00, double* %17, align 8
  %exitcond95 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond95, label %.lr.ph37.split.us.preheader, label %._crit_edge47..lr.ph41_crit_edge

._crit_edge47..lr.ph41_crit_edge:                 ; preds = %._crit_edge47
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  br label %.lr.ph41

.lr.ph37.split.us.preheader:                      ; preds = %._crit_edge47
  %18 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge34.us.3

.lr.ph15.us.us.preheader:                         ; preds = %._crit_edge20.us, %._crit_edge34.us.3..lr.ph15.us.us.preheader_crit_edge
  %indvars.iv100 = phi i64 [ 0, %._crit_edge34.us.3..lr.ph15.us.us.preheader_crit_edge ], [ %indvars.iv.next101, %._crit_edge20.us ]
  br label %.lr.ph15.us.us.new.preheader

._crit_edge20.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond2 = icmp ne i64 %indvars.iv.next101, 2000
  br i1 %exitcond2, label %.lr.ph15.us.us.preheader, label %._crit_edge20.us..lr.ph11.split.us_crit_edge

._crit_edge20.us..lr.ph11.split.us_crit_edge:     ; preds = %._crit_edge20.us
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.lr.ph11.split.us

.lr.ph15.us.us.new.preheader:                     ; preds = %._crit_edge16.us.us, %.lr.ph15.us.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.lr.ph15.us.us.preheader ], [ %indvars.iv.next99, %._crit_edge16.us.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv100
  br label %.lr.ph15.us.us.new

._crit_edge16.us.us:                              ; preds = %.lr.ph15.us.us.new
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next99, 2000
  br i1 %exitcond1, label %.lr.ph15.us.us.new.preheader, label %._crit_edge20.us

.lr.ph15.us.us.new:                               ; preds = %.lr.ph15.us.us.new, %.lr.ph15.us.us.new.preheader
  %indvars.iv54 = phi i64 [ 0, %.lr.ph15.us.us.new.preheader ], [ %indvars.iv.next55.1, %.lr.ph15.us.us.new ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv54, i64 %indvars.iv100
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv98, i64 %indvars.iv54
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next55, i64 %indvars.iv100
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next55
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 2000
  br i1 %exitcond57.1, label %._crit_edge16.us.us, label %.lr.ph15.us.us.new

.lr.ph11.split.us:                                ; preds = %._crit_edge.us, %._crit_edge20.us..lr.ph11.split.us_crit_edge
  %indvar = phi i32 [ 0, %._crit_edge20.us..lr.ph11.split.us_crit_edge ], [ %indvar.next, %._crit_edge.us ]
  %35 = sext i32 %indvar to i64
  br label %.lr.ph11.split.us.new

.lr.ph11.split.us.new:                            ; preds = %.lr.ph11.split.us.new, %.lr.ph11.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next.3, %.lr.ph11.split.us.new ]
  %36 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.us, label %.lr.ph11.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph11.split.us.new
  %indvar.next = add nuw i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge12, label %.lr.ph11.split.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  call void @free(i8* %18) #3
  ret void

._crit_edge34.us.3:                               ; preds = %._crit_edge34.us.3, %.lr.ph37.split.us.preheader
  %indvar66 = phi i64 [ 0, %.lr.ph37.split.us.preheader ], [ %indvar.next67.3, %._crit_edge34.us.3 ]
  %56 = mul nuw nsw i64 %indvar66, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %57 = add nuw nsw i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = add nuw nsw i64 %56, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %58
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %59 = add nuw nsw i64 %56, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next67.3 = add nuw nsw i64 %indvar66, 4
  %exitcond69.3 = icmp eq i64 %indvar.next67.3, 2000
  br i1 %exitcond69.3, label %._crit_edge34.us.3..lr.ph15.us.us.preheader_crit_edge, label %._crit_edge34.us.3

._crit_edge34.us.3..lr.ph15.us.us.preheader_crit_edge: ; preds = %._crit_edge34.us.3
  %60 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.lr.ph15.us.us.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph14.preheader:
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %._crit_edge11, %.lr.ph14.preheader
  %indvars.iv36 = phi i64 [ 0, %.lr.ph14.preheader ], [ %indvars.iv.next37, %._crit_edge11 ]
  %1 = add nuw nsw i64 %indvars.iv36, 4294967295
  %2 = icmp sgt i64 %indvars.iv36, 0
  br i1 %2, label %.lr.ph6.preheader, label %._crit_edge11

.lr.ph6.preheader:                                ; preds = %.lr.ph14
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 0
  br label %.lr.ph6

.lr.ph6:                                          ; preds = %._crit_edge, %.lr.ph6.preheader
  %indvars.iv20 = phi i64 [ 0, %.lr.ph6.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv20, 4294967295
  %5 = icmp sgt i64 %indvars.iv20, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv20
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph6
  %xtraiter42 = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %7

; <label>:7:                                      ; preds = %.lr.ph
  %8 = load double, double* %3, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 0
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = load double, double* %6, align 8
  %13 = fsub double %12, %11
  store double %13, double* %6, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %7
  %indvars.iv.unr.ph = phi i64 [ 1, %7 ], [ 0, %.lr.ph ]
  %14 = trunc i64 %4 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %6, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %16 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %28, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %6, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph6
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv20
  %30 = load double, double* %29, align 8
  %31 = load double, double* %6, align 8
  %32 = fdiv double %31, %30
  store double %32, double* %6, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %indvars.iv36
  br i1 %exitcond, label %.lr.ph10, label %.lr.ph6

.lr.ph10:                                         ; preds = %._crit_edge
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv36
  %xtraiter3241 = and i64 %indvars.iv36, 1
  %lcmp.mod33 = icmp eq i64 %xtraiter3241, 0
  br i1 %lcmp.mod33, label %.prol.loopexit31, label %34

; <label>:34:                                     ; preds = %.lr.ph10
  %35 = load double, double* %3, align 8
  %36 = fmul double %35, %35
  %37 = load double, double* %33, align 8
  %38 = fsub double %37, %36
  store double %38, double* %33, align 8
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.lr.ph10, %34
  %indvars.iv25.unr.ph = phi i64 [ 1, %34 ], [ 0, %.lr.ph10 ]
  %39 = trunc i64 %1 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge11, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit31
  %.pre43 = load double, double* %33, align 8
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader
  %41 = phi double [ %.pre43, %.lr.ph10.new.preheader ], [ %49, %.lr.ph10.new ]
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph10.new.preheader ], [ %indvars.iv.next26.1, %.lr.ph10.new ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv25
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %33, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv.next26
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %33, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv36
  br i1 %exitcond29.1, label %._crit_edge11.loopexit, label %.lr.ph10.new

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.new
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.prol.loopexit31, %.lr.ph14
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv36
  %51 = load double, double* %50, align 8
  %52 = call double @sqrt(double %51) #3
  store double %52, double* %50, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond40, label %._crit_edge15, label %.lr.ph14

._crit_edge15:                                    ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph5.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next12, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv9 = phi i64 [ 1, %.lr.ph5.preheader ], [ %indvars.iv.next10, %._crit_edge..lr.ph_crit_edge ]
  %5 = mul nsw i64 %indvars.iv11, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %13 ]
  %7 = add nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv9
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %13
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond15, label %._crit_edge6, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  br label %.lr.ph

._crit_edge6:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
