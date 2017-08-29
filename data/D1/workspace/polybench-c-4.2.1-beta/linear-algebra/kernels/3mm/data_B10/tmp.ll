; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %17, label %18, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %18
  br label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %21
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
  br i1 %10, label %.preheader13.lr.ph, label %..preheader12_crit_edge

..preheader12_crit_edge:                          ; preds = %9
  br label %.preheader12

.preheader13.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader13.us.preheader, label %.preheader13.lr.ph..preheader12_crit_edge

.preheader13.lr.ph..preheader12_crit_edge:        ; preds = %.preheader13.lr.ph
  br label %.preheader12

.preheader13.us.preheader:                        ; preds = %.preheader13.lr.ph
  %14 = sext i32 %0 to i64
  %wide.trip.count80 = zext i32 %2 to i64
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge45.us..preheader13.us_crit_edge, %.preheader13.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next83, %._crit_edge45.us..preheader13.us_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader13.us
  %indvars.iv78 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next79, %._crit_edge.._crit_edge_crit_edge ]
  %15 = mul nsw i64 %indvars.iv82, %indvars.iv78
  %16 = add nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv78
  store double %20, double* %21, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge45.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge45.us:                                 ; preds = %._crit_edge
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %22 = icmp slt i64 %indvars.iv.next83, %14
  br i1 %22, label %._crit_edge45.us..preheader13.us_crit_edge, label %.preheader12.loopexit

._crit_edge45.us..preheader13.us_crit_edge:       ; preds = %._crit_edge45.us
  br label %.preheader13.us

.preheader12.loopexit:                            ; preds = %._crit_edge45.us
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader13.lr.ph..preheader12_crit_edge, %..preheader12_crit_edge, %.preheader12.loopexit
  %23 = icmp sgt i32 %2, 0
  %24 = icmp sgt i32 %1, 0
  %or.cond = and i1 %23, %24
  br i1 %or.cond, label %.preheader11.us.preheader, label %.preheader12..preheader10_crit_edge

.preheader12..preheader10_crit_edge:              ; preds = %.preheader12
  br label %.preheader10

.preheader11.us.preheader:                        ; preds = %.preheader12
  %25 = sext i32 %2 to i64
  %26 = mul nsw i32 %1, 5
  %27 = sitofp i32 %26 to double
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge35.us..preheader11.us_crit_edge, %.preheader11.us.preheader
  %indvars.iv74 = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvars.iv.next75, %._crit_edge35.us..preheader11.us_crit_edge ]
  br label %._crit_edge87

._crit_edge87:                                    ; preds = %._crit_edge87.._crit_edge87_crit_edge, %.preheader11.us
  %indvars.iv72 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next73, %._crit_edge87.._crit_edge87_crit_edge ]
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %28 = mul nsw i64 %indvars.iv74, %indvars.iv.next73
  %29 = add nsw i64 %28, 2
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %1
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %27
  %34 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv72
  store double %33, double* %34, align 8
  %exitcond = icmp eq i64 %indvars.iv.next73, %wide.trip.count
  br i1 %exitcond, label %._crit_edge35.us, label %._crit_edge87.._crit_edge87_crit_edge

._crit_edge87.._crit_edge87_crit_edge:            ; preds = %._crit_edge87
  br label %._crit_edge87

._crit_edge35.us:                                 ; preds = %._crit_edge87
  %indvars.iv.next75 = add nsw i64 %indvars.iv74, 1
  %35 = icmp slt i64 %indvars.iv.next75, %25
  br i1 %35, label %._crit_edge35.us..preheader11.us_crit_edge, label %.preheader10.loopexit

._crit_edge35.us..preheader11.us_crit_edge:       ; preds = %._crit_edge35.us
  br label %.preheader11.us

.preheader10.loopexit:                            ; preds = %._crit_edge35.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader12..preheader10_crit_edge, %.preheader10.loopexit
  br i1 %24, label %.preheader9.lr.ph, label %.preheader10..preheader8_crit_edge

.preheader10..preheader8_crit_edge:               ; preds = %.preheader10
  br label %.preheader8

.preheader9.lr.ph:                                ; preds = %.preheader10
  %36 = icmp sgt i32 %4, 0
  %37 = mul nsw i32 %3, 5
  %38 = sitofp i32 %37 to double
  br i1 %36, label %.preheader9.us.preheader, label %.preheader9.lr.ph..preheader8_crit_edge

.preheader9.lr.ph..preheader8_crit_edge:          ; preds = %.preheader9.lr.ph
  br label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %39 = sext i32 %4 to i64
  %40 = sext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge25.us..preheader9.us_crit_edge, %.preheader9.us.preheader
  %indvars.iv68 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next69, %._crit_edge25.us..preheader9.us_crit_edge ]
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.._crit_edge88_crit_edge, %.preheader9.us
  %indvars.iv66 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next67, %._crit_edge88.._crit_edge88_crit_edge ]
  %41 = add nuw nsw i64 %indvars.iv66, 3
  %42 = mul nsw i64 %indvars.iv68, %41
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %3
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %38
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv68, i64 %indvars.iv66
  store double %46, double* %47, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %48 = icmp slt i64 %indvars.iv.next67, %39
  br i1 %48, label %._crit_edge88.._crit_edge88_crit_edge, label %._crit_edge25.us

._crit_edge88.._crit_edge88_crit_edge:            ; preds = %._crit_edge88
  br label %._crit_edge88

._crit_edge25.us:                                 ; preds = %._crit_edge88
  %indvars.iv.next69 = add nsw i64 %indvars.iv68, 1
  %49 = icmp slt i64 %indvars.iv.next69, %40
  br i1 %49, label %._crit_edge25.us..preheader9.us_crit_edge, label %.preheader8.loopexit

._crit_edge25.us..preheader9.us_crit_edge:        ; preds = %._crit_edge25.us
  br label %.preheader9.us

.preheader8.loopexit:                             ; preds = %._crit_edge25.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader9.lr.ph..preheader8_crit_edge, %.preheader10..preheader8_crit_edge, %.preheader8.loopexit
  %50 = icmp sgt i32 %4, 0
  br i1 %50, label %.preheader.lr.ph, label %.preheader8..preheader8._crit_edge_crit_edge

.preheader8..preheader8._crit_edge_crit_edge:     ; preds = %.preheader8
  br label %.preheader8._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader8
  %51 = icmp sgt i32 %3, 0
  %52 = mul nsw i32 %2, 5
  %53 = sitofp i32 %52 to double
  br i1 %51, label %.preheader.us.preheader, label %.preheader.lr.ph..preheader8._crit_edge_crit_edge

.preheader.lr.ph..preheader8._crit_edge_crit_edge: ; preds = %.preheader.lr.ph
  br label %.preheader8._crit_edge

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %54 = sext i32 %3 to i64
  %55 = sext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next65, %._crit_edge.us..preheader.us_crit_edge ]
  br label %._crit_edge89

._crit_edge89:                                    ; preds = %._crit_edge89.._crit_edge89_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge89.._crit_edge89_crit_edge ]
  %56 = add nuw nsw i64 %indvars.iv, 2
  %57 = mul nsw i64 %indvars.iv64, %56
  %58 = add nsw i64 %57, 2
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, %2
  %61 = sitofp i32 %60 to double
  %62 = fdiv double %61, %53
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv64, i64 %indvars.iv
  store double %62, double* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = icmp slt i64 %indvars.iv.next, %54
  br i1 %64, label %._crit_edge89.._crit_edge89_crit_edge, label %._crit_edge.us

._crit_edge89.._crit_edge89_crit_edge:            ; preds = %._crit_edge89
  br label %._crit_edge89

._crit_edge.us:                                   ; preds = %._crit_edge89
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %65 = icmp slt i64 %indvars.iv.next65, %55
  br i1 %65, label %._crit_edge.us..preheader.us_crit_edge, label %.preheader8._crit_edge.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader8._crit_edge.loopexit:                  ; preds = %._crit_edge.us
  br label %.preheader8._crit_edge

.preheader8._crit_edge:                           ; preds = %.preheader.lr.ph..preheader8._crit_edge_crit_edge, %.preheader8..preheader8._crit_edge_crit_edge, %.preheader8._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #0 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader12.lr.ph, label %..preheader11_crit_edge

..preheader11_crit_edge:                          ; preds = %12
  br label %.preheader11

.preheader12.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader12.us.preheader, label %.preheader12.lr.ph..preheader11_crit_edge

.preheader12.lr.ph..preheader11_crit_edge:        ; preds = %.preheader12.lr.ph
  br label %.preheader11

.preheader12.us.preheader:                        ; preds = %.preheader12.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %20 = sext i32 %0 to i64
  %xtraiter162 = and i32 %2, 1
  %lcmp.mod163 = icmp eq i32 %xtraiter162, 0
  %21 = icmp eq i32 %2, 1
  %wide.trip.count166 = zext i32 %1 to i64
  %wide.trip.count158.1 = zext i32 %2 to i64
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge76.us..preheader12.us_crit_edge, %.preheader12.us.preheader
  %indvars.iv170 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next171, %._crit_edge76.us..preheader12.us_crit_edge ]
  %indvar152 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvar.next153, %._crit_edge76.us..preheader12.us_crit_edge ]
  br i1 %15, label %.lr.ph70.us.us.preheader, label %._crit_edge76.us.loopexit102

.lr.ph70.us.us.preheader:                         ; preds = %.preheader12.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 0
  br label %.lr.ph70.us.us

._crit_edge76.us.loopexit102:                     ; preds = %.preheader12.us
  %scevgep154 = getelementptr [900 x double], [900 x double]* %5, i64 %indvar152, i64 0
  %scevgep154155 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154155, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge76.us

._crit_edge76.us.loopexit:                        ; preds = %._crit_edge71.us.us
  br label %._crit_edge76.us

._crit_edge76.us:                                 ; preds = %._crit_edge76.us.loopexit, %._crit_edge76.us.loopexit102
  %indvars.iv.next171 = add nsw i64 %indvars.iv170, 1
  %23 = icmp slt i64 %indvars.iv.next171, %20
  br i1 %23, label %._crit_edge76.us..preheader12.us_crit_edge, label %.preheader11.loopexit

._crit_edge76.us..preheader12.us_crit_edge:       ; preds = %._crit_edge76.us
  %indvar.next153 = add nuw nsw i64 %indvar152, 1
  br label %.preheader12.us

.lr.ph70.us.us:                                   ; preds = %._crit_edge71.us.us..lr.ph70.us.us_crit_edge, %.lr.ph70.us.us.preheader
  %indvars.iv164 = phi i64 [ 0, %.lr.ph70.us.us.preheader ], [ %indvars.iv.next165, %._crit_edge71.us.us..lr.ph70.us.us_crit_edge ]
  %24 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv170, i64 %indvars.iv164
  store double 0.000000e+00, double* %24, align 8
  br i1 %lcmp.mod163, label %.lr.ph70.us.us..prol.loopexit161_crit_edge, label %.prol.preheader160

.lr.ph70.us.us..prol.loopexit161_crit_edge:       ; preds = %.lr.ph70.us.us
  br label %.prol.loopexit161

.prol.preheader160:                               ; preds = %.lr.ph70.us.us
  %25 = load double, double* %22, align 8
  %26 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv164
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %28, 0.000000e+00
  store double %29, double* %24, align 8
  br label %.prol.loopexit161

.prol.loopexit161:                                ; preds = %.lr.ph70.us.us..prol.loopexit161_crit_edge, %.prol.preheader160
  %30 = phi double [ %29, %.prol.preheader160 ], [ 0.000000e+00, %.lr.ph70.us.us..prol.loopexit161_crit_edge ]
  %indvars.iv156.unr.ph = phi i64 [ 1, %.prol.preheader160 ], [ 0, %.lr.ph70.us.us..prol.loopexit161_crit_edge ]
  br i1 %21, label %.prol.loopexit161.._crit_edge71.us.us_crit_edge, label %.lr.ph70.us.us.new.preheader

.prol.loopexit161.._crit_edge71.us.us_crit_edge:  ; preds = %.prol.loopexit161
  br label %._crit_edge71.us.us

.lr.ph70.us.us.new.preheader:                     ; preds = %.prol.loopexit161
  br label %.lr.ph70.us.us.new

._crit_edge71.us.us.loopexit:                     ; preds = %.lr.ph70.us.us.new
  br label %._crit_edge71.us.us

._crit_edge71.us.us:                              ; preds = %.prol.loopexit161.._crit_edge71.us.us_crit_edge, %._crit_edge71.us.us.loopexit
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next165, %wide.trip.count166
  br i1 %exitcond167, label %._crit_edge76.us.loopexit, label %._crit_edge71.us.us..lr.ph70.us.us_crit_edge

._crit_edge71.us.us..lr.ph70.us.us_crit_edge:     ; preds = %._crit_edge71.us.us
  br label %.lr.ph70.us.us

.lr.ph70.us.us.new:                               ; preds = %.lr.ph70.us.us.new..lr.ph70.us.us.new_crit_edge, %.lr.ph70.us.us.new.preheader
  %31 = phi double [ %43, %.lr.ph70.us.us.new..lr.ph70.us.us.new_crit_edge ], [ %30, %.lr.ph70.us.us.new.preheader ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.1, %.lr.ph70.us.us.new..lr.ph70.us.us.new_crit_edge ], [ %indvars.iv156.unr.ph, %.lr.ph70.us.us.new.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 %indvars.iv156
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv156, i64 %indvars.iv164
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %36, %31
  store double %37, double* %24, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv170, i64 %indvars.iv.next157
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next157, i64 %indvars.iv164
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, %37
  store double %43, double* %24, align 8
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %exitcond159.1 = icmp eq i64 %indvars.iv.next157.1, %wide.trip.count158.1
  br i1 %exitcond159.1, label %._crit_edge71.us.us.loopexit, label %.lr.ph70.us.us.new..lr.ph70.us.us.new_crit_edge

.lr.ph70.us.us.new..lr.ph70.us.us.new_crit_edge:  ; preds = %.lr.ph70.us.us.new
  br label %.lr.ph70.us.us.new

.preheader11.loopexit:                            ; preds = %._crit_edge76.us
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader12.lr.ph..preheader11_crit_edge, %..preheader11_crit_edge, %.preheader11.loopexit
  %44 = icmp sgt i32 %1, 0
  br i1 %44, label %.preheader10.lr.ph, label %.preheader11..preheader9_crit_edge

.preheader11..preheader9_crit_edge:               ; preds = %.preheader11
  br label %.preheader9

.preheader10.lr.ph:                               ; preds = %.preheader11
  %45 = icmp sgt i32 %3, 0
  %46 = icmp sgt i32 %4, 0
  br i1 %45, label %.preheader10.us.preheader, label %.preheader10.lr.ph..preheader9_crit_edge

.preheader10.lr.ph..preheader9_crit_edge:         ; preds = %.preheader10.lr.ph
  br label %.preheader9

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %47 = add i32 %3, -1
  %48 = zext i32 %47 to i64
  %49 = shl nuw nsw i64 %48, 3
  %50 = add nuw nsw i64 %49, 8
  %51 = sext i32 %1 to i64
  %xtraiter135 = and i32 %4, 1
  %lcmp.mod136 = icmp eq i32 %xtraiter135, 0
  %52 = icmp eq i32 %4, 1
  %wide.trip.count139 = zext i32 %3 to i64
  %wide.trip.count131.1 = zext i32 %4 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge46.us..preheader10.us_crit_edge, %.preheader10.us.preheader
  %indvars.iv143 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next144, %._crit_edge46.us..preheader10.us_crit_edge ]
  %indvar125 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvar.next126, %._crit_edge46.us..preheader10.us_crit_edge ]
  br i1 %46, label %.lr.ph40.us.us.preheader, label %._crit_edge46.us.loopexit100

.lr.ph40.us.us.preheader:                         ; preds = %.preheader10.us
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 0
  br label %.lr.ph40.us.us

._crit_edge46.us.loopexit100:                     ; preds = %.preheader10.us
  %scevgep127 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvar125, i64 0
  %scevgep127128 = bitcast double* %scevgep127 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep127128, i8 0, i64 %50, i32 8, i1 false)
  br label %._crit_edge46.us

._crit_edge46.us.loopexit:                        ; preds = %._crit_edge41.us.us
  br label %._crit_edge46.us

._crit_edge46.us:                                 ; preds = %._crit_edge46.us.loopexit, %._crit_edge46.us.loopexit100
  %indvars.iv.next144 = add nsw i64 %indvars.iv143, 1
  %54 = icmp slt i64 %indvars.iv.next144, %51
  br i1 %54, label %._crit_edge46.us..preheader10.us_crit_edge, label %.preheader9.loopexit

._crit_edge46.us..preheader10.us_crit_edge:       ; preds = %._crit_edge46.us
  %indvar.next126 = add nuw nsw i64 %indvar125, 1
  br label %.preheader10.us

.lr.ph40.us.us:                                   ; preds = %._crit_edge41.us.us..lr.ph40.us.us_crit_edge, %.lr.ph40.us.us.preheader
  %indvars.iv137 = phi i64 [ 0, %.lr.ph40.us.us.preheader ], [ %indvars.iv.next138, %._crit_edge41.us.us..lr.ph40.us.us_crit_edge ]
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv143, i64 %indvars.iv137
  store double 0.000000e+00, double* %55, align 8
  br i1 %lcmp.mod136, label %.lr.ph40.us.us..prol.loopexit134_crit_edge, label %.prol.preheader133

.lr.ph40.us.us..prol.loopexit134_crit_edge:       ; preds = %.lr.ph40.us.us
  br label %.prol.loopexit134

.prol.preheader133:                               ; preds = %.lr.ph40.us.us
  %56 = load double, double* %53, align 8
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv137
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %59, 0.000000e+00
  store double %60, double* %55, align 8
  br label %.prol.loopexit134

.prol.loopexit134:                                ; preds = %.lr.ph40.us.us..prol.loopexit134_crit_edge, %.prol.preheader133
  %61 = phi double [ %60, %.prol.preheader133 ], [ 0.000000e+00, %.lr.ph40.us.us..prol.loopexit134_crit_edge ]
  %indvars.iv129.unr.ph = phi i64 [ 1, %.prol.preheader133 ], [ 0, %.lr.ph40.us.us..prol.loopexit134_crit_edge ]
  br i1 %52, label %.prol.loopexit134.._crit_edge41.us.us_crit_edge, label %.lr.ph40.us.us.new.preheader

.prol.loopexit134.._crit_edge41.us.us_crit_edge:  ; preds = %.prol.loopexit134
  br label %._crit_edge41.us.us

.lr.ph40.us.us.new.preheader:                     ; preds = %.prol.loopexit134
  br label %.lr.ph40.us.us.new

._crit_edge41.us.us.loopexit:                     ; preds = %.lr.ph40.us.us.new
  br label %._crit_edge41.us.us

._crit_edge41.us.us:                              ; preds = %.prol.loopexit134.._crit_edge41.us.us_crit_edge, %._crit_edge41.us.us.loopexit
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %._crit_edge46.us.loopexit, label %._crit_edge41.us.us..lr.ph40.us.us_crit_edge

._crit_edge41.us.us..lr.ph40.us.us_crit_edge:     ; preds = %._crit_edge41.us.us
  br label %.lr.ph40.us.us

.lr.ph40.us.us.new:                               ; preds = %.lr.ph40.us.us.new..lr.ph40.us.us.new_crit_edge, %.lr.ph40.us.us.new.preheader
  %62 = phi double [ %74, %.lr.ph40.us.us.new..lr.ph40.us.us.new_crit_edge ], [ %61, %.lr.ph40.us.us.new.preheader ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.1, %.lr.ph40.us.us.new..lr.ph40.us.us.new_crit_edge ], [ %indvars.iv129.unr.ph, %.lr.ph40.us.us.new.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv129
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv129, i64 %indvars.iv137
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %67, %62
  store double %68, double* %55, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv.next130
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next130, i64 %indvars.iv137
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %73, %68
  store double %74, double* %55, align 8
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %exitcond132.1 = icmp eq i64 %indvars.iv.next130.1, %wide.trip.count131.1
  br i1 %exitcond132.1, label %._crit_edge41.us.us.loopexit, label %.lr.ph40.us.us.new..lr.ph40.us.us.new_crit_edge

.lr.ph40.us.us.new..lr.ph40.us.us.new_crit_edge:  ; preds = %.lr.ph40.us.us.new
  br label %.lr.ph40.us.us.new

.preheader9.loopexit:                             ; preds = %._crit_edge46.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader10.lr.ph..preheader9_crit_edge, %.preheader11..preheader9_crit_edge, %.preheader9.loopexit
  %75 = icmp sgt i32 %3, 0
  %or.cond = and i1 %13, %75
  br i1 %or.cond, label %.preheader.us.preheader, label %.preheader9..preheader9._crit_edge_crit_edge

.preheader9..preheader9._crit_edge_crit_edge:     ; preds = %.preheader9
  br label %.preheader9._crit_edge

.preheader.us.preheader:                          ; preds = %.preheader9
  %76 = add i32 %3, -1
  %77 = zext i32 %76 to i64
  %78 = shl nuw nsw i64 %77, 3
  %79 = add nuw nsw i64 %78, 8
  %80 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %81 = icmp eq i32 %1, 1
  %wide.trip.count115 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge16.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv118 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next119, %._crit_edge16.us..preheader.us_crit_edge ]
  %indvar = phi i64 [ 0, %.preheader.us.preheader ], [ %indvar.next, %._crit_edge16.us..preheader.us_crit_edge ]
  br i1 %44, label %.lr.ph.us.us.preheader, label %._crit_edge16.us.loopexit98

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %82 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit98:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvar, i64 0
  %scevgep112 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112, i8 0, i64 %79, i32 8, i1 false)
  br label %._crit_edge16.us

._crit_edge16.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %._crit_edge16.us.loopexit98
  %indvars.iv.next119 = add nsw i64 %indvars.iv118, 1
  %83 = icmp slt i64 %indvars.iv.next119, %80
  br i1 %83, label %._crit_edge16.us..preheader.us_crit_edge, label %.preheader9._crit_edge.loopexit

._crit_edge16.us..preheader.us_crit_edge:         ; preds = %._crit_edge16.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  br label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next114, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %84 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv118, i64 %indvars.iv113
  store double 0.000000e+00, double* %84, align 8
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %85 = load double, double* %82, align 8
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv113
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, 0.000000e+00
  store double %89, double* %84, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %90 = phi double [ %89, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %81, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond, label %._crit_edge16.us.loopexit, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %91 = phi double [ %103, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %90, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %92 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv113
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fadd double %96, %91
  store double %97, double* %84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv.next
  %99 = load double, double* %98, align 8
  %100 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv113
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fadd double %102, %97
  store double %103, double* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.preheader9._crit_edge.loopexit:                  ; preds = %._crit_edge16.us
  br label %.preheader9._crit_edge

.preheader9._crit_edge:                           ; preds = %.preheader9..preheader9._crit_edge_crit_edge, %.preheader9._crit_edge.loopexit
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
  br i1 %or.cond, label %.preheader.us.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %3
  br label %._crit_edge

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us..preheader.us_crit_edge ]
  %11 = mul nsw i64 %10, %indvars.iv11
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13.._crit_edge14_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13.._crit_edge14_crit_edge ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge14.._crit_edge13_crit_edge

._crit_edge14.._crit_edge13_crit_edge:            ; preds = %._crit_edge14
  br label %._crit_edge13

; <label>:16:                                     ; preds = %._crit_edge14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14.._crit_edge13_crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13.._crit_edge14_crit_edge

._crit_edge13.._crit_edge14_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge14

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %22 = icmp slt i64 %indvars.iv.next12, %10
  br i1 %22, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
