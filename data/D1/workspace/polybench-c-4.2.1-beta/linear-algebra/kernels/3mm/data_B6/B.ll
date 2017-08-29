; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %16)
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

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader51.lr.ph, label %.preheader50

.preheader51.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader51.us.preheader, label %.preheader48

.preheader51.us.preheader:                        ; preds = %.preheader51.lr.ph
  %wide.trip.count100 = zext i32 %2 to i64
  %wide.trip.count104 = zext i32 %0 to i64
  br label %.preheader51.us

.preheader51.us:                                  ; preds = %._crit_edge68.us, %.preheader51.us.preheader
  %indvars.iv102 = phi i64 [ 0, %.preheader51.us.preheader ], [ %indvars.iv.next103, %._crit_edge68.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader51.us
  %indvars.iv98 = phi i64 [ 0, %.preheader51.us ], [ %indvars.iv.next99, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv98, %indvars.iv102
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv102, i64 %indvars.iv98
  store double %19, double* %20, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge68.us, label %._crit_edge

._crit_edge68.us:                                 ; preds = %._crit_edge
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, %wide.trip.count104
  br i1 %exitcond105, label %.preheader50.loopexit, label %.preheader51.us

.preheader50.loopexit:                            ; preds = %._crit_edge68.us
  br label %.preheader50

.preheader50:                                     ; preds = %.preheader50.loopexit, %9
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader49.lr.ph, label %.preheader48

.preheader49.lr.ph:                               ; preds = %.preheader50
  %22 = icmp sgt i32 %1, 0
  %23 = mul nsw i32 %1, 5
  %24 = sitofp i32 %23 to double
  br i1 %22, label %.preheader49.us.preheader, label %.preheader46

.preheader49.us.preheader:                        ; preds = %.preheader49.lr.ph
  %wide.trip.count91 = zext i32 %1 to i64
  %wide.trip.count95 = zext i32 %2 to i64
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %._crit_edge63.us, %.preheader49.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.preheader49.us.preheader ], [ %indvars.iv.next94, %._crit_edge63.us ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107, %.preheader49.us
  %indvars.iv89 = phi i64 [ 0, %.preheader49.us ], [ %indvars.iv.next90, %._crit_edge107 ]
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %25 = mul nuw nsw i64 %indvars.iv.next90, %indvars.iv93
  %26 = add nuw nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv93, i64 %indvars.iv89
  store double %30, double* %31, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %._crit_edge63.us, label %._crit_edge107

._crit_edge63.us:                                 ; preds = %._crit_edge107
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %.preheader48.loopexit, label %.preheader49.us

.preheader48.loopexit:                            ; preds = %._crit_edge63.us
  br label %.preheader48

.preheader48:                                     ; preds = %.preheader48.loopexit, %.preheader50, %.preheader51.lr.ph
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %.preheader47.lr.ph, label %.preheader46

.preheader47.lr.ph:                               ; preds = %.preheader48
  %33 = icmp sgt i32 %4, 0
  %34 = mul nsw i32 %3, 5
  %35 = sitofp i32 %34 to double
  br i1 %33, label %.preheader47.us.preheader, label %._crit_edge55

.preheader47.us.preheader:                        ; preds = %.preheader47.lr.ph
  %wide.trip.count82 = zext i32 %4 to i64
  %wide.trip.count86 = zext i32 %1 to i64
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %._crit_edge58.us, %.preheader47.us.preheader
  %indvars.iv84 = phi i64 [ 0, %.preheader47.us.preheader ], [ %indvars.iv.next85, %._crit_edge58.us ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108, %.preheader47.us
  %indvars.iv80 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next81, %._crit_edge108 ]
  %36 = add nuw nsw i64 %indvars.iv80, 3
  %37 = mul nuw nsw i64 %36, %indvars.iv84
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %3
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %35
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv84, i64 %indvars.iv80
  store double %41, double* %42, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge58.us, label %._crit_edge108

._crit_edge58.us:                                 ; preds = %._crit_edge108
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  br i1 %exitcond87, label %.preheader46.loopexit, label %.preheader47.us

.preheader46.loopexit:                            ; preds = %._crit_edge58.us
  br label %.preheader46

.preheader46:                                     ; preds = %.preheader46.loopexit, %.preheader48, %.preheader49.lr.ph
  %43 = icmp sgt i32 %4, 0
  br i1 %43, label %.preheader.lr.ph, label %._crit_edge55

.preheader.lr.ph:                                 ; preds = %.preheader46
  %44 = icmp sgt i32 %3, 0
  %45 = mul nsw i32 %2, 5
  %46 = sitofp i32 %45 to double
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge55

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count77 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv75 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next76, %._crit_edge.us ]
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge109 ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nuw nsw i64 %47, %indvars.iv75
  %49 = add nuw nsw i64 %48, 2
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %2
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %46
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv75, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge109

._crit_edge.us:                                   ; preds = %._crit_edge109
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77
  br i1 %exitcond78, label %._crit_edge55.loopexit, label %.preheader.us

._crit_edge55.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %.preheader.lr.ph, %.preheader46, %.preheader47.lr.ph
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader61.lr.ph, label %.preheader60

.preheader61.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader61.us.preheader, label %.preheader.lr.ph

.preheader61.us.preheader:                        ; preds = %.preheader61.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count166 = zext i32 %0 to i64
  %xtraiter156 = and i32 %2, 1
  %lcmp.mod157 = icmp eq i32 %xtraiter156, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count160 = zext i32 %1 to i64
  %wide.trip.count152.1 = zext i32 %2 to i64
  br label %.preheader61.us

.preheader61.us:                                  ; preds = %._crit_edge94.us, %.preheader61.us.preheader
  %indvars.iv164 = phi i64 [ 0, %.preheader61.us.preheader ], [ %indvars.iv.next165, %._crit_edge94.us ]
  br i1 %15, label %.lr.ph90.us.us.preheader, label %._crit_edge94.us.loopexit106

.lr.ph90.us.us.preheader:                         ; preds = %.preheader61.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv164, i64 0
  br label %.lr.ph90.us.us

._crit_edge94.us.loopexit106:                     ; preds = %.preheader61.us
  %scevgep148 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv164, i64 0
  %scevgep148149 = bitcast double* %scevgep148 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep148149, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge94.us

._crit_edge94.us.loopexit:                        ; preds = %._crit_edge91.us.us
  br label %._crit_edge94.us

._crit_edge94.us:                                 ; preds = %._crit_edge94.us.loopexit, %._crit_edge94.us.loopexit106
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %.preheader60.loopexit, label %.preheader61.us

.lr.ph90.us.us:                                   ; preds = %._crit_edge91.us.us, %.lr.ph90.us.us.preheader
  %indvars.iv158 = phi i64 [ 0, %.lr.ph90.us.us.preheader ], [ %indvars.iv.next159, %._crit_edge91.us.us ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv164, i64 %indvars.iv158
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod157, label %.prol.loopexit155, label %.prol.preheader154

.prol.preheader154:                               ; preds = %.lr.ph90.us.us
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv158
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double 0.000000e+00, %26
  store double %27, double* %22, align 8
  br label %.prol.loopexit155

.prol.loopexit155:                                ; preds = %.lr.ph90.us.us, %.prol.preheader154
  %28 = phi double [ %27, %.prol.preheader154 ], [ 0.000000e+00, %.lr.ph90.us.us ]
  %indvars.iv150.unr.ph = phi i64 [ 1, %.prol.preheader154 ], [ 0, %.lr.ph90.us.us ]
  br i1 %20, label %._crit_edge91.us.us, label %.lr.ph90.us.us.new.preheader

.lr.ph90.us.us.new.preheader:                     ; preds = %.prol.loopexit155
  br label %.lr.ph90.us.us.new

._crit_edge91.us.us.loopexit:                     ; preds = %.lr.ph90.us.us.new
  br label %._crit_edge91.us.us

._crit_edge91.us.us:                              ; preds = %._crit_edge91.us.us.loopexit, %.prol.loopexit155
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, %wide.trip.count160
  br i1 %exitcond161, label %._crit_edge94.us.loopexit, label %.lr.ph90.us.us

.lr.ph90.us.us.new:                               ; preds = %.lr.ph90.us.us.new.preheader, %.lr.ph90.us.us.new
  %29 = phi double [ %41, %.lr.ph90.us.us.new ], [ %28, %.lr.ph90.us.us.new.preheader ]
  %indvars.iv150 = phi i64 [ %indvars.iv.next151.1, %.lr.ph90.us.us.new ], [ %indvars.iv150.unr.ph, %.lr.ph90.us.us.new.preheader ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv164, i64 %indvars.iv150
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv150, i64 %indvars.iv158
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %22, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv164, i64 %indvars.iv.next151
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next151, i64 %indvars.iv158
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %22, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %exitcond153.1 = icmp eq i64 %indvars.iv.next151.1, %wide.trip.count152.1
  br i1 %exitcond153.1, label %._crit_edge91.us.us.loopexit, label %.lr.ph90.us.us.new

.preheader60.loopexit:                            ; preds = %._crit_edge94.us
  br label %.preheader60

.preheader60:                                     ; preds = %.preheader60.loopexit, %12
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader59.lr.ph, label %.preheader58

.preheader59.lr.ph:                               ; preds = %.preheader60
  %43 = icmp sgt i32 %3, 0
  %44 = icmp sgt i32 %4, 0
  br i1 %43, label %.preheader59.us.preheader, label %.preheader58

.preheader59.us.preheader:                        ; preds = %.preheader59.lr.ph
  %45 = add i32 %3, -1
  %46 = zext i32 %45 to i64
  %47 = shl nuw nsw i64 %46, 3
  %48 = add nuw nsw i64 %47, 8
  %wide.trip.count141 = zext i32 %1 to i64
  %xtraiter131 = and i32 %4, 1
  %lcmp.mod132 = icmp eq i32 %xtraiter131, 0
  %49 = icmp eq i32 %4, 1
  %wide.trip.count135 = zext i32 %3 to i64
  %wide.trip.count127.1 = zext i32 %4 to i64
  br label %.preheader59.us

.preheader59.us:                                  ; preds = %._crit_edge80.us, %.preheader59.us.preheader
  %indvars.iv139 = phi i64 [ 0, %.preheader59.us.preheader ], [ %indvars.iv.next140, %._crit_edge80.us ]
  br i1 %44, label %.lr.ph76.us.us.preheader, label %._crit_edge80.us.loopexit104

.lr.ph76.us.us.preheader:                         ; preds = %.preheader59.us
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv139, i64 0
  br label %.lr.ph76.us.us

._crit_edge80.us.loopexit104:                     ; preds = %.preheader59.us
  %scevgep123 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv139, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123124, i8 0, i64 %48, i32 8, i1 false)
  br label %._crit_edge80.us

._crit_edge80.us.loopexit:                        ; preds = %._crit_edge77.us.us
  br label %._crit_edge80.us

._crit_edge80.us:                                 ; preds = %._crit_edge80.us.loopexit, %._crit_edge80.us.loopexit104
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, %wide.trip.count141
  br i1 %exitcond142, label %.preheader58.loopexit, label %.preheader59.us

.lr.ph76.us.us:                                   ; preds = %._crit_edge77.us.us, %.lr.ph76.us.us.preheader
  %indvars.iv133 = phi i64 [ 0, %.lr.ph76.us.us.preheader ], [ %indvars.iv.next134, %._crit_edge77.us.us ]
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv139, i64 %indvars.iv133
  store double 0.000000e+00, double* %51, align 8
  br i1 %lcmp.mod132, label %.prol.loopexit130, label %.prol.preheader129

.prol.preheader129:                               ; preds = %.lr.ph76.us.us
  %52 = load double, double* %50, align 8
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv133
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double 0.000000e+00, %55
  store double %56, double* %51, align 8
  br label %.prol.loopexit130

.prol.loopexit130:                                ; preds = %.lr.ph76.us.us, %.prol.preheader129
  %57 = phi double [ %56, %.prol.preheader129 ], [ 0.000000e+00, %.lr.ph76.us.us ]
  %indvars.iv125.unr.ph = phi i64 [ 1, %.prol.preheader129 ], [ 0, %.lr.ph76.us.us ]
  br i1 %49, label %._crit_edge77.us.us, label %.lr.ph76.us.us.new.preheader

.lr.ph76.us.us.new.preheader:                     ; preds = %.prol.loopexit130
  br label %.lr.ph76.us.us.new

._crit_edge77.us.us.loopexit:                     ; preds = %.lr.ph76.us.us.new
  br label %._crit_edge77.us.us

._crit_edge77.us.us:                              ; preds = %._crit_edge77.us.us.loopexit, %.prol.loopexit130
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond136, label %._crit_edge80.us.loopexit, label %.lr.ph76.us.us

.lr.ph76.us.us.new:                               ; preds = %.lr.ph76.us.us.new.preheader, %.lr.ph76.us.us.new
  %58 = phi double [ %70, %.lr.ph76.us.us.new ], [ %57, %.lr.ph76.us.us.new.preheader ]
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %.lr.ph76.us.us.new ], [ %indvars.iv125.unr.ph, %.lr.ph76.us.us.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv139, i64 %indvars.iv125
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv125, i64 %indvars.iv133
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %51, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv139, i64 %indvars.iv.next126
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next126, i64 %indvars.iv133
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %51, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond128.1 = icmp eq i64 %indvars.iv.next126.1, %wide.trip.count127.1
  br i1 %exitcond128.1, label %._crit_edge77.us.us.loopexit, label %.lr.ph76.us.us.new

.preheader58.loopexit:                            ; preds = %._crit_edge80.us
  br label %.preheader58

.preheader58:                                     ; preds = %.preheader58.loopexit, %.preheader59.lr.ph, %.preheader60
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge67

.preheader.lr.ph:                                 ; preds = %.preheader58, %.preheader61.lr.ph
  %71 = icmp sgt i32 %3, 0
  %72 = icmp sgt i32 %1, 0
  br i1 %71, label %.preheader.us.preheader, label %._crit_edge67

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %73 = add i32 %3, -1
  %74 = zext i32 %73 to i64
  %75 = shl nuw nsw i64 %74, 3
  %76 = add nuw nsw i64 %75, 8
  %wide.trip.count116 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %77 = icmp eq i32 %1, 1
  %wide.trip.count111 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge65.us, %.preheader.us.preheader
  %indvars.iv114 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next115, %._crit_edge65.us ]
  br i1 %72, label %.lr.ph.us.us.preheader, label %._crit_edge65.us.loopexit102

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %78 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 0
  br label %.lr.ph.us.us

._crit_edge65.us.loopexit102:                     ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv114, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 %76, i32 8, i1 false)
  br label %._crit_edge65.us

._crit_edge65.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge65.us

._crit_edge65.us:                                 ; preds = %._crit_edge65.us.loopexit, %._crit_edge65.us.loopexit102
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %._crit_edge67.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv109 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next110, %._crit_edge.us.us ]
  %79 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv109
  store double 0.000000e+00, double* %79, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %80 = load double, double* %78, align 8
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv109
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fadd double 0.000000e+00, %83
  store double %84, double* %79, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %85 = phi double [ %84, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %77, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond = icmp eq i64 %indvars.iv.next110, %wide.trip.count111
  br i1 %exitcond, label %._crit_edge65.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %86 = phi double [ %98, %.lr.ph.us.us.new ], [ %85, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %87 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv109
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %86, %91
  store double %92, double* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %93 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv109
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %92, %97
  store double %98, double* %79, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge67.loopexit:                           ; preds = %._crit_edge65.us
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67.loopexit, %.preheader.lr.ph, %.preheader58
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv14, %10
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge19
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
