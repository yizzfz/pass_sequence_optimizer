; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  %22 = bitcast i8* %9 to [1200 x double]*
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  %12 = icmp sgt i32 %2, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader10.lr.ph..preheader10.us_crit_edge, label %.preheader7

.preheader10.lr.ph..preheader10.us_crit_edge:     ; preds = %.preheader10.lr.ph
  %14 = add i32 %2, -1
  %15 = sext i32 %0 to i64
  %wide.trip.count52 = zext i32 %14 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.lr.ph..preheader10.us_crit_edge
  %indvars.iv54 = phi i64 [ 0, %.preheader10.lr.ph..preheader10.us_crit_edge ], [ %indvars.iv.next55, %._crit_edge27.us ]
  br label %16

; <label>:16:                                     ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge ], [ 0, %.preheader10.us ]
  %17 = mul nuw nsw i64 %indvars.iv50, %indvars.iv54
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv50
  store double %22, double* %23, align 8
  %exitcond53 = icmp eq i64 %indvars.iv50, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %16
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  br label %16

._crit_edge27.us:                                 ; preds = %16
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next55, %15
  br i1 %exitcond60, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %25 = icmp sgt i32 %1, 0
  %26 = sitofp i32 %1 to double
  br i1 %25, label %.preheader8.lr.ph..preheader8.us_crit_edge, label %.preheader5

.preheader8.lr.ph..preheader8.us_crit_edge:       ; preds = %.preheader8.lr.ph
  %27 = add i32 %1, -1
  %28 = sext i32 %2 to i64
  %wide.trip.count45 = zext i32 %27 to i64
  %29 = and i64 %wide.trip.count45, 1
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.lr.ph..preheader8.us_crit_edge
  %indvars.iv47 = phi i64 [ 0, %.preheader8.lr.ph..preheader8.us_crit_edge ], [ %indvars.iv.next48, %._crit_edge22.us ]
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %._crit_edge30.prol, label %._crit_edge30.prol.loopexit

._crit_edge30.prol:                               ; preds = %.preheader8.us
  %31 = trunc i64 %indvars.iv47 to i32
  %32 = srem i32 %31, %1
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %26
  %35 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv47, i64 0
  store double %34, double* %35, align 8
  br label %._crit_edge30.prol.loopexit

._crit_edge30.prol.loopexit:                      ; preds = %._crit_edge30.prol, %.preheader8.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %._crit_edge30.prol ], [ 0, %.preheader8.us ]
  %36 = icmp eq i32 %27, 0
  br i1 %36, label %._crit_edge22.us, label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %._crit_edge30.prol.loopexit
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %.preheader8.us.new
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %.preheader8.us.new ], [ %indvars.iv.next44.1, %._crit_edge30 ]
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %37 = mul nuw nsw i64 %indvars.iv.next44, %indvars.iv47
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %1
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %26
  %42 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv47, i64 %indvars.iv43
  store double %41, double* %42, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %43 = mul nuw nsw i64 %indvars.iv.next44.1, %indvars.iv47
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %1
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %26
  %48 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv47, i64 %indvars.iv.next44
  store double %47, double* %48, align 8
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46.1, label %._crit_edge22.us.loopexit, label %._crit_edge30

._crit_edge22.us.loopexit:                        ; preds = %._crit_edge30
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %._crit_edge30.prol.loopexit
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next48, %28
  br i1 %exitcond59, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9, %.preheader10.lr.ph
  %49 = icmp sgt i32 %1, 0
  br i1 %49, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %50 = icmp sgt i32 %3, 0
  %51 = sitofp i32 %3 to double
  br i1 %50, label %.preheader6.lr.ph..preheader6.us_crit_edge, label %.preheader5

.preheader6.lr.ph..preheader6.us_crit_edge:       ; preds = %.preheader6.lr.ph
  %52 = add i32 %3, -1
  %53 = sext i32 %1 to i64
  %wide.trip.count38 = zext i32 %52 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.lr.ph..preheader6.us_crit_edge
  %indvars.iv40 = phi i64 [ 0, %.preheader6.lr.ph..preheader6.us_crit_edge ], [ %indvars.iv.next41, %._crit_edge17.us ]
  br label %54

; <label>:54:                                     ; preds = %._crit_edge61, %.preheader6.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge61 ], [ 0, %.preheader6.us ]
  %55 = add nuw nsw i64 %indvars.iv36, 3
  %56 = mul nuw nsw i64 %55, %indvars.iv40
  %57 = add nuw nsw i64 %56, 1
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, %3
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %51
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv40, i64 %indvars.iv36
  store double %61, double* %62, align 8
  %exitcond39 = icmp eq i64 %indvars.iv36, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge17.us, label %._crit_edge61

._crit_edge61:                                    ; preds = %54
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %54

._crit_edge17.us:                                 ; preds = %54
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next41, %53
  br i1 %exitcond58, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader6.lr.ph, %.preheader7, %.preheader8.lr.ph
  %63 = icmp sgt i32 %0, 0
  br i1 %63, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %64 = icmp sgt i32 %3, 0
  %65 = sitofp i32 %2 to double
  br i1 %64, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge14

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %66 = add i32 %3, -1
  %67 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %66 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv33 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next34, %._crit_edge.us ]
  br label %68

; <label>:68:                                     ; preds = %._crit_edge62, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge62 ], [ 0, %.preheader.us ]
  %69 = add nuw nsw i64 %indvars.iv, 2
  %70 = mul nuw nsw i64 %69, %indvars.iv33
  %71 = trunc i64 %70 to i32
  %72 = srem i32 %71, %2
  %73 = sitofp i32 %72 to double
  %74 = fdiv double %73, %65
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv33, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge62

._crit_edge62:                                    ; preds = %68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %68

._crit_edge.us:                                   ; preds = %68
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next34, %67
  br i1 %exitcond57, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader6.lr.ph, label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.preheader6.lr.ph..preheader6.us_crit_edge, label %.preheader.lr.ph

.preheader6.lr.ph..preheader6.us_crit_edge:       ; preds = %.preheader6.lr.ph
  %14 = add i32 %1, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = add i32 %2, -1
  %19 = sext i32 %1 to i64
  %20 = sext i32 %0 to i64
  %wide.trip.count50 = zext i32 %18 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.lr.ph..preheader6.us_crit_edge
  %indvars.iv54 = phi i64 [ 0, %.preheader6.lr.ph..preheader6.us_crit_edge ], [ %indvars.iv.next55, %._crit_edge25.us ]
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.lr.ph21.us.us.preheader, label %.lr.ph24..lr.ph24.split_crit_edge.us.._crit_edge25.us_crit_edge

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  br label %.lr.ph21.us.us

.lr.ph24..lr.ph24.split_crit_edge.us.._crit_edge25.us_crit_edge: ; preds = %.preheader6.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv54, i64 0
  %scevgep47 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep47, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %.lr.ph24..lr.ph24.split_crit_edge.us.._crit_edge25.us_crit_edge
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next55, %20
  br i1 %exitcond62, label %.preheader.lr.ph.loopexit, label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %.lr.ph21.us.us.preheader, %._crit_edge22.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us.us ], [ 0, %.lr.ph21.us.us.preheader ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv52
  store double 0.000000e+00, double* %22, align 8
  br label %23

._crit_edge22.us.us:                              ; preds = %23
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next53, %19
  br i1 %exitcond61, label %._crit_edge25.us.loopexit, label %.lr.ph21.us.us

; <label>:23:                                     ; preds = %._crit_edge, %.lr.ph21.us.us
  %24 = phi double [ %31, %._crit_edge ], [ 0.000000e+00, %.lr.ph21.us.us ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge ], [ 0, %.lr.ph21.us.us ]
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv54, i64 %indvars.iv48
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %4
  %28 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv48, i64 %indvars.iv52
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %24, %30
  store double %31, double* %22, align 8
  %exitcond51 = icmp eq i64 %indvars.iv48, %wide.trip.count50
  br i1 %exitcond51, label %._crit_edge22.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %23
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br label %23

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge25.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader6.lr.ph
  %32 = icmp sgt i32 %3, 0
  br i1 %32, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge12

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader.lr.ph
  %33 = add i32 %3, -1
  %34 = add i32 %1, -1
  %35 = sext i32 %3 to i64
  %36 = sext i32 %0 to i64
  %wide.trip.count36 = zext i32 %34 to i64
  %wide.trip.count = zext i32 %33 to i64
  %37 = add nuw nsw i64 %wide.trip.count, 1
  %38 = and i64 %37, 8589934588
  %39 = add nsw i64 %38, -4
  %40 = lshr exact i64 %39, 2
  %n.vec = and i64 %37, 8589934588
  %broadcast.splatinsert66 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat67 = shufflevector <2 x double> %broadcast.splatinsert66, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = and i64 %40, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv40 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next41, %._crit_edge10.us ]
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  %43 = icmp ult i64 %37, 4
  br i1 %43, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader69, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  %44 = icmp eq i64 %n.vec, 0
  br i1 %44, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader69, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %45 = icmp eq i64 %41, 0
  br i1 %45, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.ph
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 0
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %47, align 8
  %48 = getelementptr [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load65.prol = load <2 x double>, <2 x double>* %49, align 8
  %50 = fmul <2 x double> %wide.load.prol, %broadcast.splat67
  %51 = fmul <2 x double> %wide.load65.prol, %broadcast.splat67
  store <2 x double> %50, <2 x double>* %47, align 8
  store <2 x double> %51, <2 x double>* %49, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  %52 = icmp eq i64 %40, 0
  br i1 %52, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %56, align 8
  %57 = fmul <2 x double> %wide.load, %broadcast.splat67
  %58 = fmul <2 x double> %wide.load65, %broadcast.splat67
  store <2 x double> %57, <2 x double>* %54, align 8
  store <2 x double> %58, <2 x double>* %56, align 8
  %index.next = add i64 %index, 4
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 %index.next
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %60, align 8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load65.1 = load <2 x double>, <2 x double>* %62, align 8
  %63 = fmul <2 x double> %wide.load.1, %broadcast.splat67
  %64 = fmul <2 x double> %wide.load65.1, %broadcast.splat67
  store <2 x double> %63, <2 x double>* %60, align 8
  store <2 x double> %64, <2 x double>* %62, align 8
  %index.next.1 = add i64 %index, 8
  %65 = icmp eq i64 %index.next.1, %n.vec
  br i1 %65, label %middle.block.loopexit, label %vector.body, !llvm.loop !1

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %66 = icmp eq i64 %37, %n.vec
  br i1 %66, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader69

.lr.ph9..lr.ph9.split_crit_edge.us.preheader69:   ; preds = %middle.block, %min.iters.checked, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader ]
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader69, %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge ], [ %indvars.iv.ph, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader69 ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %5
  store double %69, double* %67, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge10.us.loopexit71, label %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge, !llvm.loop !4

.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us.loopexit71:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit71, %._crit_edge10.us.loopexit, %middle.block
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %70 = icmp slt i64 %indvars.iv.next41, %36
  br i1 %70, label %.preheader.us, label %._crit_edge12.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv40, i64 %indvars.iv38
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %5
  store double %73, double* %71, align 8
  br label %74

._crit_edge.us.us:                                ; preds = %74
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next39, %35
  br i1 %exitcond60, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

; <label>:74:                                     ; preds = %._crit_edge68, %.lr.ph.us.us
  %75 = phi double [ %81, %._crit_edge68 ], [ %73, %.lr.ph.us.us ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge68 ], [ 0, %.lr.ph.us.us ]
  %76 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv40, i64 %indvars.iv34
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv38
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %75, %80
  store double %81, double* %71, align 8
  %exitcond37 = icmp eq i64 %indvars.iv34, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge.us.us, label %._crit_edge68

._crit_edge68:                                    ; preds = %74
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  br label %74

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader.lr.ph, %11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge4

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %3
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %12 = mul nsw i64 %indvars.iv6, %11
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %13 = add nsw i64 %indvars.iv, %12
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, %11
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
