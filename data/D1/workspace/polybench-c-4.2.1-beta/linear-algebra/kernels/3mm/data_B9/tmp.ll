; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader6.us.preheader, label %.preheader3

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count43 = zext i32 %2 to i64
  %wide.trip.count47 = zext i32 %0 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge13.us, %.preheader6.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next46, %._crit_edge13.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6.us
  %indvars.iv41 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next42, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv41, %indvars.iv45
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv41
  store double %19, double* %20, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge13.us, label %._crit_edge

._crit_edge13.us:                                 ; preds = %._crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge13.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %9
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader4.lr.ph, label %.preheader3

.preheader4.lr.ph:                                ; preds = %.preheader5
  %22 = icmp sgt i32 %1, 0
  %23 = mul nsw i32 %1, 5
  %24 = sitofp i32 %23 to double
  br i1 %22, label %.preheader4.us.preheader, label %.preheader1

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count34 = zext i32 %1 to i64
  %wide.trip.count38 = zext i32 %2 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next37, %._crit_edge11.us ]
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53, %.preheader4.us
  %indvars.iv32 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next33, %._crit_edge53 ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %25 = mul nuw nsw i64 %indvars.iv.next33, %indvars.iv36
  %26 = add nuw nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv36, i64 %indvars.iv32
  store double %30, double* %31, align 8
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge11.us, label %._crit_edge53

._crit_edge11.us:                                 ; preds = %._crit_edge53
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %.preheader3.loopexit, label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge11.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader5, %.preheader6.lr.ph
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %.preheader2.lr.ph, label %.preheader1

.preheader2.lr.ph:                                ; preds = %.preheader3
  %33 = icmp sgt i32 %4, 0
  %34 = mul nsw i32 %3, 5
  %35 = sitofp i32 %34 to double
  br i1 %33, label %.preheader2.us.preheader, label %._crit_edge7

.preheader2.us.preheader:                         ; preds = %.preheader2.lr.ph
  %wide.trip.count25 = zext i32 %4 to i64
  %wide.trip.count29 = zext i32 %1 to i64
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge9.us, %.preheader2.us.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next28, %._crit_edge9.us ]
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54, %.preheader2.us
  %indvars.iv23 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next24, %._crit_edge54 ]
  %36 = add nuw nsw i64 %indvars.iv23, 3
  %37 = mul nuw nsw i64 %36, %indvars.iv27
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %3
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %35
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv27, i64 %indvars.iv23
  store double %41, double* %42, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge9.us, label %._crit_edge54

._crit_edge9.us:                                  ; preds = %._crit_edge54
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %.preheader1.loopexit, label %.preheader2.us

.preheader1.loopexit:                             ; preds = %._crit_edge9.us
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %.preheader3, %.preheader4.lr.ph
  %43 = icmp sgt i32 %4, 0
  br i1 %43, label %.preheader.lr.ph, label %._crit_edge7

.preheader.lr.ph:                                 ; preds = %.preheader1
  %44 = icmp sgt i32 %3, 0
  %45 = mul nsw i32 %2, 5
  %46 = sitofp i32 %45 to double
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count20 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us ]
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge55 ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nuw nsw i64 %47, %indvars.iv18
  %49 = add nuw nsw i64 %48, 2
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %2
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %46
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv18, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge55

._crit_edge.us:                                   ; preds = %._crit_edge55
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader.lr.ph, %.preheader1, %.preheader2.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader9.lr.ph, label %.preheader8

.preheader9.lr.ph:                                ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader9.us.preheader, label %.preheader.lr.ph

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count101 = zext i32 %0 to i64
  %xtraiter90 = and i32 %2, 1
  %lcmp.mod91 = icmp eq i32 %xtraiter90, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count95 = zext i32 %1 to i64
  %wide.trip.count86.1 = zext i32 %2 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge22.us, %.preheader9.us.preheader
  %indvars.iv99 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next100, %._crit_edge22.us ]
  br i1 %15, label %.lr.ph19.us.us.preheader, label %._crit_edge22.us.loopexit39

.lr.ph19.us.us.preheader:                         ; preds = %.preheader9.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv99, i64 0
  br label %.lr.ph19.us.us

._crit_edge22.us.loopexit39:                      ; preds = %.preheader9.us
  %scevgep82 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv99, i64 0
  %scevgep8283 = bitcast double* %scevgep82 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8283, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge22.us

._crit_edge22.us.loopexit:                        ; preds = %._crit_edge20.us.us
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %._crit_edge22.us.loopexit39
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, %wide.trip.count101
  br i1 %exitcond102, label %.preheader8.loopexit, label %.preheader9.us

.lr.ph19.us.us:                                   ; preds = %._crit_edge20.us.us, %.lr.ph19.us.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.lr.ph19.us.us.preheader ], [ %indvars.iv.next94, %._crit_edge20.us.us ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv99, i64 %indvars.iv93
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod91, label %.prol.loopexit89, label %.prol.preheader88

.prol.preheader88:                                ; preds = %.lr.ph19.us.us
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv93
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %26, 0.000000e+00
  store double %27, double* %22, align 8
  br label %.prol.loopexit89

.prol.loopexit89:                                 ; preds = %.lr.ph19.us.us, %.prol.preheader88
  %indvars.iv84.unr.ph = phi i64 [ 1, %.prol.preheader88 ], [ 0, %.lr.ph19.us.us ]
  %.unr92.ph = phi double [ %27, %.prol.preheader88 ], [ 0.000000e+00, %.lr.ph19.us.us ]
  br i1 %20, label %._crit_edge20.us.us, label %.lr.ph19.us.us.new.preheader

.lr.ph19.us.us.new.preheader:                     ; preds = %.prol.loopexit89
  br label %.lr.ph19.us.us.new

._crit_edge20.us.us.loopexit:                     ; preds = %.lr.ph19.us.us.new
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit, %.prol.loopexit89
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %._crit_edge22.us.loopexit, label %.lr.ph19.us.us

.lr.ph19.us.us.new:                               ; preds = %.lr.ph19.us.us.new.preheader, %.lr.ph19.us.us.new
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.1, %.lr.ph19.us.us.new ], [ %indvars.iv84.unr.ph, %.lr.ph19.us.us.new.preheader ]
  %28 = phi double [ %40, %.lr.ph19.us.us.new ], [ %.unr92.ph, %.lr.ph19.us.us.new.preheader ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv99, i64 %indvars.iv84
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv93
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %22, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv99, i64 %indvars.iv.next85
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next85, i64 %indvars.iv93
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %22, align 8
  %indvars.iv.next85.1 = add nuw nsw i64 %indvars.iv84, 2
  %exitcond87.1 = icmp eq i64 %indvars.iv.next85.1, %wide.trip.count86.1
  br i1 %exitcond87.1, label %._crit_edge20.us.us.loopexit, label %.lr.ph19.us.us.new

.preheader8.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %12
  %41 = icmp sgt i32 %1, 0
  br i1 %41, label %.preheader7.lr.ph, label %.preheader6

.preheader7.lr.ph:                                ; preds = %.preheader8
  %42 = icmp sgt i32 %3, 0
  %43 = icmp sgt i32 %4, 0
  br i1 %42, label %.preheader7.us.preheader, label %.preheader6

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %44 = add i32 %3, -1
  %45 = zext i32 %44 to i64
  %46 = shl nuw nsw i64 %45, 3
  %47 = add nuw nsw i64 %46, 8
  %wide.trip.count75 = zext i32 %1 to i64
  %xtraiter64 = and i32 %4, 1
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %48 = icmp eq i32 %4, 1
  %wide.trip.count69 = zext i32 %3 to i64
  %wide.trip.count60.1 = zext i32 %4 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge17.us, %.preheader7.us.preheader
  %indvars.iv73 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next74, %._crit_edge17.us ]
  br i1 %43, label %.lr.ph14.us.us.preheader, label %._crit_edge17.us.loopexit37

.lr.ph14.us.us.preheader:                         ; preds = %.preheader7.us
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv73, i64 0
  br label %.lr.ph14.us.us

._crit_edge17.us.loopexit37:                      ; preds = %.preheader7.us
  %scevgep56 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv73, i64 0
  %scevgep5657 = bitcast double* %scevgep56 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep5657, i8 0, i64 %47, i32 8, i1 false)
  br label %._crit_edge17.us

._crit_edge17.us.loopexit:                        ; preds = %._crit_edge15.us.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %._crit_edge17.us.loopexit37
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader6.loopexit, label %.preheader7.us

.lr.ph14.us.us:                                   ; preds = %._crit_edge15.us.us, %.lr.ph14.us.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.lr.ph14.us.us.preheader ], [ %indvars.iv.next68, %._crit_edge15.us.us ]
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv73, i64 %indvars.iv67
  store double 0.000000e+00, double* %50, align 8
  br i1 %lcmp.mod65, label %.prol.loopexit63, label %.prol.preheader62

.prol.preheader62:                                ; preds = %.lr.ph14.us.us
  %51 = load double, double* %49, align 8
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv67
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %54, 0.000000e+00
  store double %55, double* %50, align 8
  br label %.prol.loopexit63

.prol.loopexit63:                                 ; preds = %.lr.ph14.us.us, %.prol.preheader62
  %indvars.iv58.unr.ph = phi i64 [ 1, %.prol.preheader62 ], [ 0, %.lr.ph14.us.us ]
  %.unr66.ph = phi double [ %55, %.prol.preheader62 ], [ 0.000000e+00, %.lr.ph14.us.us ]
  br i1 %48, label %._crit_edge15.us.us, label %.lr.ph14.us.us.new.preheader

.lr.ph14.us.us.new.preheader:                     ; preds = %.prol.loopexit63
  br label %.lr.ph14.us.us.new

._crit_edge15.us.us.loopexit:                     ; preds = %.lr.ph14.us.us.new
  br label %._crit_edge15.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.loopexit, %.prol.loopexit63
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge17.us.loopexit, label %.lr.ph14.us.us

.lr.ph14.us.us.new:                               ; preds = %.lr.ph14.us.us.new.preheader, %.lr.ph14.us.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph14.us.us.new ], [ %indvars.iv58.unr.ph, %.lr.ph14.us.us.new.preheader ]
  %56 = phi double [ %68, %.lr.ph14.us.us.new ], [ %.unr66.ph, %.lr.ph14.us.us.new.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv73, i64 %indvars.iv58
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv58, i64 %indvars.iv67
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %50, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv73, i64 %indvars.iv.next59
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next59, i64 %indvars.iv67
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %50, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond61.1, label %._crit_edge15.us.us.loopexit, label %.lr.ph14.us.us.new

.preheader6.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader7.lr.ph, %.preheader8
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge12

.preheader.lr.ph:                                 ; preds = %.preheader6, %.preheader9.lr.ph
  %69 = icmp sgt i32 %3, 0
  %70 = icmp sgt i32 %1, 0
  br i1 %69, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %71 = add i32 %3, -1
  %72 = zext i32 %71 to i64
  %73 = shl nuw nsw i64 %72, 3
  %74 = add nuw nsw i64 %73, 8
  %wide.trip.count49 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %75 = icmp eq i32 %1, 1
  %wide.trip.count44 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next48, %._crit_edge11.us ]
  br i1 %70, label %.lr.ph.us.us.preheader, label %._crit_edge11.us.loopexit35

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %76 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv47, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit35:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv47, i64 0
  %scevgep41 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep41, i8 0, i64 %74, i32 8, i1 false)
  br label %._crit_edge11.us

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %._crit_edge11.us.loopexit35
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %._crit_edge12.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv42 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next43, %._crit_edge.us.us ]
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv47, i64 %indvars.iv42
  store double 0.000000e+00, double* %77, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %78 = load double, double* %76, align 8
  %79 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv42
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, 0.000000e+00
  store double %82, double* %77, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %82, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %75, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond, label %._crit_edge11.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %83 = phi double [ %95, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %84 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv42
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %83, %88
  store double %89, double* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %90 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv.next
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv42
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %89, %94
  store double %95, double* %77, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader.lr.ph, %.preheader6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge1

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count5 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next4, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv3, %10
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, %wide.trip.count5
  br i1 %exitcond6, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
