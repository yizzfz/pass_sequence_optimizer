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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @free(i8* %3) #4
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
  %18 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  call void @free(i8* %18) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph21.preheader:
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %._crit_edge16..lr.ph21_crit_edge, %.lr.ph21.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge16..lr.ph21_crit_edge ], [ 0, %.lr.ph21.preheader ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge16..lr.ph21_crit_edge ], [ 0, %.lr.ph21.preheader ]
  %sext = shl i64 %indvars.iv53, 32
  %1 = ashr exact i64 %sext, 32
  %2 = add nuw i64 %indvars.iv46, 4294967295
  %3 = icmp sgt i64 %indvars.iv46, 0
  br i1 %3, label %.lr.ph7.preheader, label %._crit_edge16

.lr.ph7.preheader:                                ; preds = %.lr.ph21
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 0
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %._crit_edge, %.lr.ph7.preheader
  %indvars.iv29 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next30, %._crit_edge ]
  %5 = add nuw i64 %indvars.iv29, 4294967295
  %6 = icmp sgt i64 %indvars.iv29, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv29
  br i1 %6, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph7
  %xtraiter52 = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter52, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %8

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load double, double* %4, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv29
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = load double, double* %7, align 8
  %14 = fsub double %13, %12
  store double %14, double* %7, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %8
  %indvars.iv.unr.ph = phi i64 [ 1, %8 ], [ 0, %.lr.ph ]
  %15 = trunc i64 %5 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %.pre = load double, double* %7, align 8
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph.new.preheader
  %17 = phi double [ %.pre, %.lr.ph.new.preheader ], [ %29, %.lr.ph.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv29
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv29
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.lr.ph7
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv29
  %31 = load double, double* %30, align 8
  %32 = load double, double* %7, align 8
  %33 = fdiv double %32, %31
  store double %33, double* %7, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %indvars.iv46
  br i1 %exitcond, label %.lr.ph15.split.us.preheader, label %.lr.ph7

.lr.ph15.split.us.preheader:                      ; preds = %._crit_edge
  %xtraiter4251 = and i64 %indvars.iv46, 1
  %34 = trunc i64 %2 to i32
  %35 = icmp eq i64 %xtraiter4251, 0
  %36 = icmp eq i32 %34, 0
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge12.us, %.lr.ph15.split.us.preheader
  %indvars.iv55 = phi i64 [ %1, %.lr.ph15.split.us.preheader ], [ %indvars.iv.next56, %._crit_edge12.us ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv55
  br i1 %35, label %.prol.loopexit41, label %38

; <label>:38:                                     ; preds = %.lr.ph15.split.us
  %39 = load double, double* %4, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv55
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %37, align 8
  %44 = fsub double %43, %42
  store double %44, double* %37, align 8
  br label %.prol.loopexit41

.prol.loopexit41:                                 ; preds = %.lr.ph15.split.us, %38
  %indvars.iv35.unr.ph = phi i64 [ 1, %38 ], [ 0, %.lr.ph15.split.us ]
  br i1 %36, label %._crit_edge12.us, label %.lr.ph15.split.us.new.preheader

.lr.ph15.split.us.new.preheader:                  ; preds = %.prol.loopexit41
  %.pre57 = load double, double* %37, align 8
  br label %.lr.ph15.split.us.new

.lr.ph15.split.us.new:                            ; preds = %.lr.ph15.split.us.new, %.lr.ph15.split.us.new.preheader
  %45 = phi double [ %.pre57, %.lr.ph15.split.us.new.preheader ], [ %57, %.lr.ph15.split.us.new ]
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %.lr.ph15.split.us.new.preheader ], [ %indvars.iv.next36.1, %.lr.ph15.split.us.new ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv35
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv55
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fsub double %45, %50
  store double %51, double* %37, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next36
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next36, i64 %indvars.iv55
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fsub double %51, %56
  store double %57, double* %37, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next36.1, %indvars.iv46
  br i1 %exitcond39.1, label %._crit_edge12.us.loopexit, label %.lr.ph15.split.us.new

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph15.split.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit41
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %58 = icmp slt i64 %indvars.iv.next56, 2000
  br i1 %58, label %.lr.ph15.split.us, label %._crit_edge16.loopexit

._crit_edge16.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.lr.ph21
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond50, label %._crit_edge22, label %._crit_edge16..lr.ph21_crit_edge

._crit_edge16..lr.ph21_crit_edge:                 ; preds = %._crit_edge16
  %indvars.iv.next54 = add nsw i64 %1, 1
  br label %.lr.ph21

._crit_edge22:                                    ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond7, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
