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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %22 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %22)
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
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %._crit_edge.lr.ph, label %._crit_edge8

._crit_edge.lr.ph:                                ; preds = %9
  %wide.trip.count81 = zext i32 %2 to i64
  %11 = icmp sgt i32 %2, 0
  %12 = sext i32 %0 to i64
  %13 = mul nsw i32 %0, 5
  %14 = sitofp i32 %13 to double
  br i1 %11, label %._crit_edge.us.preheader, label %._crit_edge8

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge46.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge46.us ], [ 0, %._crit_edge.us.preheader ]
  br label %15

; <label>:15:                                     ; preds = %15, %._crit_edge.us
  %indvars.iv79 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next80, %15 ]
  %16 = mul nsw i64 %indvars.iv83, %indvars.iv79
  %17 = add nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %14
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv83, i64 %indvars.iv79
  store double %21, double* %22, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, %wide.trip.count81
  br i1 %exitcond82, label %._crit_edge46.us, label %15

._crit_edge46.us:                                 ; preds = %15
  %indvars.iv.next84 = add nsw i64 %indvars.iv83, 1
  %23 = icmp slt i64 %indvars.iv.next84, %12
  br i1 %23, label %._crit_edge.us, label %._crit_edge8.loopexit

._crit_edge8.loopexit:                            ; preds = %._crit_edge46.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %._crit_edge.lr.ph, %9
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %._crit_edge9.lr.ph, label %._crit_edge10

._crit_edge9.lr.ph:                               ; preds = %._crit_edge8
  %wide.trip.count = zext i32 %1 to i64
  %25 = icmp sgt i32 %1, 0
  %26 = sext i32 %2 to i64
  br i1 %25, label %._crit_edge9.us.preheader, label %._crit_edge10

._crit_edge9.us.preheader:                        ; preds = %._crit_edge9.lr.ph
  %27 = mul nsw i32 %1, 5
  %28 = sitofp i32 %27 to double
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.preheader, %._crit_edge36.us
  %indvars.iv75 = phi i64 [ 0, %._crit_edge9.us.preheader ], [ %indvars.iv.next76, %._crit_edge36.us ]
  br label %29

; <label>:29:                                     ; preds = %29, %._crit_edge9.us
  %indvars.iv73 = phi i64 [ 0, %._crit_edge9.us ], [ %indvars.iv.next74, %29 ]
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %30 = mul nsw i64 %indvars.iv75, %indvars.iv.next74
  %31 = add nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %28
  %36 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv75, i64 %indvars.iv73
  store double %35, double* %36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next74, %wide.trip.count
  br i1 %exitcond, label %._crit_edge36.us, label %29

._crit_edge36.us:                                 ; preds = %29
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, 1
  %37 = icmp slt i64 %indvars.iv.next76, %26
  br i1 %37, label %._crit_edge9.us, label %._crit_edge10.loopexit

._crit_edge10.loopexit:                           ; preds = %._crit_edge36.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %._crit_edge9.lr.ph, %._crit_edge8
  %38 = icmp sgt i32 %1, 0
  br i1 %38, label %._crit_edge11.lr.ph, label %._crit_edge12

._crit_edge11.lr.ph:                              ; preds = %._crit_edge10
  %39 = icmp sgt i32 %4, 0
  %40 = sext i32 %1 to i64
  %41 = mul nsw i32 %3, 5
  %42 = sitofp i32 %41 to double
  %43 = sext i32 %4 to i64
  br i1 %39, label %._crit_edge11.us.preheader, label %._crit_edge12

._crit_edge11.us.preheader:                       ; preds = %._crit_edge11.lr.ph
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge26.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge26.us ], [ 0, %._crit_edge11.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %._crit_edge11.us, %44
  %indvars.iv67 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next68, %44 ]
  %45 = add nuw nsw i64 %indvars.iv67, 3
  %46 = mul nsw i64 %indvars.iv69, %45
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %3
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %42
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv69, i64 %indvars.iv67
  store double %50, double* %51, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %52 = icmp slt i64 %indvars.iv.next68, %43
  br i1 %52, label %44, label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %44
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %53 = icmp slt i64 %indvars.iv.next70, %40
  br i1 %53, label %._crit_edge11.us, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge11.lr.ph, %._crit_edge10
  %54 = icmp sgt i32 %4, 0
  br i1 %54, label %._crit_edge13.lr.ph, label %.loopexit

._crit_edge13.lr.ph:                              ; preds = %._crit_edge12
  %55 = icmp sgt i32 %3, 0
  %56 = sext i32 %4 to i64
  %57 = mul nsw i32 %2, 5
  %58 = sitofp i32 %57 to double
  %59 = sext i32 %3 to i64
  br i1 %55, label %._crit_edge13.us.preheader, label %.loopexit

._crit_edge13.us.preheader:                       ; preds = %._crit_edge13.lr.ph
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge18.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge18.us ], [ 0, %._crit_edge13.us.preheader ]
  br label %60

; <label>:60:                                     ; preds = %._crit_edge13.us, %60
  %indvars.iv = phi i64 [ 0, %._crit_edge13.us ], [ %indvars.iv.next, %60 ]
  %61 = add nuw nsw i64 %indvars.iv, 2
  %62 = mul nsw i64 %indvars.iv65, %61
  %63 = add nsw i64 %62, 2
  %64 = trunc i64 %63 to i32
  %65 = srem i32 %64, %2
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %58
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv65, i64 %indvars.iv
  store double %67, double* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = icmp slt i64 %indvars.iv.next, %59
  br i1 %69, label %60, label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %60
  %indvars.iv.next66 = add nsw i64 %indvars.iv65, 1
  %70 = icmp slt i64 %indvars.iv.next66, %56
  br i1 %70, label %._crit_edge13.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge18.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge13.lr.ph, %._crit_edge12
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %._crit_edge.lr.ph, label %._crit_edge9

._crit_edge.lr.ph:                                ; preds = %12
  %wide.trip.count165 = zext i32 %1 to i64
  %14 = icmp sgt i32 %1, 0
  %wide.trip.count161.1 = zext i32 %2 to i64
  %15 = sext i32 %0 to i64
  br i1 %14, label %._crit_edge.us.preheader, label %._crit_edge9

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %xtraiter180 = and i32 %2, 1
  %20 = icmp sgt i32 %2, 0
  %21 = icmp eq i32 %xtraiter180, 0
  %22 = icmp eq i32 %2, 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge78.us
  %indvars.iv169 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next170, %._crit_edge78.us ]
  %indvar155 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvar.next156, %._crit_edge78.us ]
  br i1 %20, label %.lr.ph72.us.us.preheader, label %.lr.ph77..lr.ph77.split_crit_edge.us.preheader

.lr.ph72.us.us.preheader:                         ; preds = %._crit_edge.us
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv169, i64 0
  br label %.lr.ph72.us.us

.lr.ph77..lr.ph77.split_crit_edge.us.preheader:   ; preds = %._crit_edge.us
  %scevgep157 = getelementptr [900 x double], [900 x double]* %5, i64 %indvar155, i64 0
  %24 = bitcast double* %scevgep157 to i8*
  call void @llvm.memset.p0i8.i64(i8* %24, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge78.us

._crit_edge78.us.loopexit:                        ; preds = %._crit_edge73.us.us
  br label %._crit_edge78.us

._crit_edge78.us:                                 ; preds = %._crit_edge78.us.loopexit, %.lr.ph77..lr.ph77.split_crit_edge.us.preheader
  %indvars.iv.next170 = add nsw i64 %indvars.iv169, 1
  %25 = icmp slt i64 %indvars.iv.next170, %15
  %indvar.next156 = add nuw nsw i64 %indvar155, 1
  br i1 %25, label %._crit_edge.us, label %._crit_edge9.loopexit

.lr.ph72.us.us:                                   ; preds = %.lr.ph72.us.us.preheader, %._crit_edge73.us.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %._crit_edge73.us.us ], [ 0, %.lr.ph72.us.us.preheader ]
  %26 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv169, i64 %indvars.iv163
  store double 0.000000e+00, double* %26, align 8
  br i1 %21, label %.prol.loopexit179, label %27

; <label>:27:                                     ; preds = %.lr.ph72.us.us
  %28 = load double, double* %23, align 8
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv163
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, 0.000000e+00
  store double %32, double* %26, align 8
  br label %.prol.loopexit179

.prol.loopexit179:                                ; preds = %.lr.ph72.us.us, %27
  %33 = phi double [ %32, %27 ], [ 0.000000e+00, %.lr.ph72.us.us ]
  %indvars.iv159.unr.ph = phi i64 [ 1, %27 ], [ 0, %.lr.ph72.us.us ]
  br i1 %22, label %._crit_edge73.us.us, label %.lr.ph72.us.us.new.preheader

.lr.ph72.us.us.new.preheader:                     ; preds = %.prol.loopexit179
  br label %.lr.ph72.us.us.new

._crit_edge73.us.us.loopexit:                     ; preds = %.lr.ph72.us.us.new
  br label %._crit_edge73.us.us

._crit_edge73.us.us:                              ; preds = %._crit_edge73.us.us.loopexit, %.prol.loopexit179
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %wide.trip.count165
  br i1 %exitcond166, label %._crit_edge78.us.loopexit, label %.lr.ph72.us.us

.lr.ph72.us.us.new:                               ; preds = %.lr.ph72.us.us.new.preheader, %.lr.ph72.us.us.new
  %34 = phi double [ %46, %.lr.ph72.us.us.new ], [ %33, %.lr.ph72.us.us.new.preheader ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160.1, %.lr.ph72.us.us.new ], [ %indvars.iv159.unr.ph, %.lr.ph72.us.us.new.preheader ]
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv169, i64 %indvars.iv159
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv159, i64 %indvars.iv163
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %39, %34
  store double %40, double* %26, align 8
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv169, i64 %indvars.iv.next160
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next160, i64 %indvars.iv163
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %45, %40
  store double %46, double* %26, align 8
  %indvars.iv.next160.1 = add nuw nsw i64 %indvars.iv159, 2
  %exitcond162.1 = icmp eq i64 %indvars.iv.next160.1, %wide.trip.count161.1
  br i1 %exitcond162.1, label %._crit_edge73.us.us.loopexit, label %.lr.ph72.us.us.new

._crit_edge9.loopexit:                            ; preds = %._crit_edge78.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge.lr.ph, %12
  %47 = icmp sgt i32 %1, 0
  br i1 %47, label %._crit_edge10.lr.ph, label %._crit_edge11

._crit_edge10.lr.ph:                              ; preds = %._crit_edge9
  %wide.trip.count142 = zext i32 %3 to i64
  %48 = icmp sgt i32 %3, 0
  %wide.trip.count138.1 = zext i32 %4 to i64
  %49 = sext i32 %1 to i64
  br i1 %48, label %._crit_edge10.us.preheader, label %._crit_edge11

._crit_edge10.us.preheader:                       ; preds = %._crit_edge10.lr.ph
  %50 = add i32 %3, -1
  %51 = zext i32 %50 to i64
  %52 = shl nuw nsw i64 %51, 3
  %53 = add nuw nsw i64 %52, 8
  %xtraiter176 = and i32 %4, 1
  %54 = icmp sgt i32 %4, 0
  %55 = icmp eq i32 %xtraiter176, 0
  %56 = icmp eq i32 %4, 1
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge48.us
  %indvars.iv146 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvars.iv.next147, %._crit_edge48.us ]
  %indvar132 = phi i64 [ 0, %._crit_edge10.us.preheader ], [ %indvar.next133, %._crit_edge48.us ]
  br i1 %54, label %.lr.ph42.us.us.preheader, label %.lr.ph47..lr.ph47.split_crit_edge.us.preheader

.lr.ph42.us.us.preheader:                         ; preds = %._crit_edge10.us
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv146, i64 0
  br label %.lr.ph42.us.us

.lr.ph47..lr.ph47.split_crit_edge.us.preheader:   ; preds = %._crit_edge10.us
  %scevgep134 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvar132, i64 0
  %58 = bitcast double* %scevgep134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %58, i8 0, i64 %53, i32 8, i1 false)
  br label %._crit_edge48.us

._crit_edge48.us.loopexit:                        ; preds = %._crit_edge43.us.us
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.lr.ph47..lr.ph47.split_crit_edge.us.preheader
  %indvars.iv.next147 = add nsw i64 %indvars.iv146, 1
  %59 = icmp slt i64 %indvars.iv.next147, %49
  %indvar.next133 = add nuw nsw i64 %indvar132, 1
  br i1 %59, label %._crit_edge10.us, label %._crit_edge11.loopexit

.lr.ph42.us.us:                                   ; preds = %.lr.ph42.us.us.preheader, %._crit_edge43.us.us
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge43.us.us ], [ 0, %.lr.ph42.us.us.preheader ]
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv146, i64 %indvars.iv140
  store double 0.000000e+00, double* %60, align 8
  br i1 %55, label %.prol.loopexit175, label %61

; <label>:61:                                     ; preds = %.lr.ph42.us.us
  %62 = load double, double* %57, align 8
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv140
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %65, 0.000000e+00
  store double %66, double* %60, align 8
  br label %.prol.loopexit175

.prol.loopexit175:                                ; preds = %.lr.ph42.us.us, %61
  %67 = phi double [ %66, %61 ], [ 0.000000e+00, %.lr.ph42.us.us ]
  %indvars.iv136.unr.ph = phi i64 [ 1, %61 ], [ 0, %.lr.ph42.us.us ]
  br i1 %56, label %._crit_edge43.us.us, label %.lr.ph42.us.us.new.preheader

.lr.ph42.us.us.new.preheader:                     ; preds = %.prol.loopexit175
  br label %.lr.ph42.us.us.new

._crit_edge43.us.us.loopexit:                     ; preds = %.lr.ph42.us.us.new
  br label %._crit_edge43.us.us

._crit_edge43.us.us:                              ; preds = %._crit_edge43.us.us.loopexit, %.prol.loopexit175
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %._crit_edge48.us.loopexit, label %.lr.ph42.us.us

.lr.ph42.us.us.new:                               ; preds = %.lr.ph42.us.us.new.preheader, %.lr.ph42.us.us.new
  %68 = phi double [ %80, %.lr.ph42.us.us.new ], [ %67, %.lr.ph42.us.us.new.preheader ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137.1, %.lr.ph42.us.us.new ], [ %indvars.iv136.unr.ph, %.lr.ph42.us.us.new.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv146, i64 %indvars.iv136
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv136, i64 %indvars.iv140
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %73, %68
  store double %74, double* %60, align 8
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv146, i64 %indvars.iv.next137
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next137, i64 %indvars.iv140
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, %74
  store double %80, double* %60, align 8
  %indvars.iv.next137.1 = add nuw nsw i64 %indvars.iv136, 2
  %exitcond139.1 = icmp eq i64 %indvars.iv.next137.1, %wide.trip.count138.1
  br i1 %exitcond139.1, label %._crit_edge43.us.us.loopexit, label %.lr.ph42.us.us.new

._crit_edge11.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %._crit_edge10.lr.ph, %._crit_edge9
  %81 = icmp sgt i32 %0, 0
  br i1 %81, label %._crit_edge12.lr.ph, label %.loopexit

._crit_edge12.lr.ph:                              ; preds = %._crit_edge11
  %wide.trip.count121 = zext i32 %3 to i64
  %82 = icmp sgt i32 %3, 0
  %wide.trip.count117.1 = zext i32 %1 to i64
  %83 = sext i32 %0 to i64
  br i1 %82, label %._crit_edge12.us.preheader, label %.loopexit

._crit_edge12.us.preheader:                       ; preds = %._crit_edge12.lr.ph
  %84 = add i32 %3, -1
  %85 = zext i32 %84 to i64
  %86 = shl nuw nsw i64 %85, 3
  %87 = add nuw nsw i64 %86, 8
  %xtraiter = and i32 %1, 1
  %88 = icmp sgt i32 %1, 0
  %89 = icmp eq i32 %xtraiter, 0
  %90 = icmp eq i32 %1, 1
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.preheader, %._crit_edge18.us
  %indvars.iv125 = phi i64 [ 0, %._crit_edge12.us.preheader ], [ %indvars.iv.next126, %._crit_edge18.us ]
  %indvar = phi i64 [ 0, %._crit_edge12.us.preheader ], [ %indvar.next, %._crit_edge18.us ]
  br i1 %88, label %.lr.ph.us.us.preheader, label %.lr.ph17..lr.ph17.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge12.us
  %91 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv125, i64 0
  br label %.lr.ph.us.us

.lr.ph17..lr.ph17.split_crit_edge.us.preheader:   ; preds = %._crit_edge12.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvar, i64 0
  %92 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %92, i8 0, i64 %87, i32 8, i1 false)
  br label %._crit_edge18.us

._crit_edge18.us.loopexit:                        ; preds = %._crit_edge15.us.us
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %.lr.ph17..lr.ph17.split_crit_edge.us.preheader
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %93 = icmp slt i64 %indvars.iv.next126, %83
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %93, label %._crit_edge12.us, label %.loopexit.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge15.us.us
  %indvars.iv119 = phi i64 [ %indvars.iv.next120, %._crit_edge15.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv125, i64 %indvars.iv119
  store double 0.000000e+00, double* %94, align 8
  br i1 %89, label %.prol.loopexit, label %95

; <label>:95:                                     ; preds = %.lr.ph.us.us
  %96 = load double, double* %91, align 8
  %97 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv119
  %98 = load double, double* %97, align 8
  %99 = fmul double %96, %98
  %100 = fadd double %99, 0.000000e+00
  store double %100, double* %94, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %95
  %101 = phi double [ %100, %95 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv115.unr.ph = phi i64 [ 1, %95 ], [ 0, %.lr.ph.us.us ]
  br i1 %90, label %._crit_edge15.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge15.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge15.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next120, %wide.trip.count121
  br i1 %exitcond122, label %._crit_edge18.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %102 = phi double [ %114, %.lr.ph.us.us.new ], [ %101, %.lr.ph.us.us.new.preheader ]
  %indvars.iv115 = phi i64 [ %indvars.iv.next116.1, %.lr.ph.us.us.new ], [ %indvars.iv115.unr.ph, %.lr.ph.us.us.new.preheader ]
  %103 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv125, i64 %indvars.iv115
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv115, i64 %indvars.iv119
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fadd double %107, %102
  store double %108, double* %94, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %109 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv125, i64 %indvars.iv.next116
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next116, i64 %indvars.iv119
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fadd double %113, %108
  store double %114, double* %94, align 8
  %indvars.iv.next116.1 = add nuw nsw i64 %indvars.iv115, 2
  %exitcond118.1 = icmp eq i64 %indvars.iv.next116.1, %wide.trip.count117.1
  br i1 %exitcond118.1, label %._crit_edge15.us.us.loopexit, label %.lr.ph.us.us.new

.loopexit.loopexit:                               ; preds = %._crit_edge18.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge12.lr.ph, %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4.us ], [ 0, %._crit_edge.us.preheader ]
  %11 = mul nsw i64 %10, %indvars.iv13
  br label %12

; <label>:12:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %12

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %23 = icmp slt i64 %indvars.iv.next14, %10
  br i1 %23, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
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
