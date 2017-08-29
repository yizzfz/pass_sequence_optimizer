; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph35, label %.._crit_edge36_crit_edge

.._crit_edge36_crit_edge:                         ; preds = %6
  br label %._crit_edge36

.lr.ph35:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = zext i32 %2 to i64
  %11 = add nsw i64 %10, -1
  %xtraiter76 = and i64 %10, 1
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  %12 = icmp eq i64 %11, 0
  %xtraiter81 = and i64 %10, 3
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  %13 = icmp ult i64 %11, 3
  %wide.trip.count69 = zext i32 %1 to i64
  %xtraiter = and i32 %1, 1
  %14 = icmp eq i32 %1, 1
  %wide.trip.count73 = zext i32 %0 to i64
  %15 = zext i32 %xtraiter to i64
  br label %16

; <label>:16:                                     ; preds = %._crit_edge18._crit_edge, %.lr.ph35
  %indvars.iv71 = phi i64 [ 0, %.lr.ph35 ], [ %indvars.iv.next72, %._crit_edge18._crit_edge ]
  br i1 %8, label %.lr.ph17, label %.._crit_edge18_crit_edge

.._crit_edge18_crit_edge:                         ; preds = %16
  br label %._crit_edge18

.lr.ph17:                                         ; preds = %16
  br i1 %9, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph17.split.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %.lr.ph17
  br label %.lr.ph.us.us.preheader

.lr.ph17.split.preheader:                         ; preds = %.lr.ph17
  br i1 %14, label %.lr.ph17.split.preheader.._crit_edge18_crit_edge, label %._crit_edge13.1.preheader

.lr.ph17.split.preheader.._crit_edge18_crit_edge: ; preds = %.lr.ph17.split.preheader
  br label %._crit_edge18

._crit_edge13.1.preheader:                        ; preds = %.lr.ph17.split.preheader
  br label %._crit_edge13.1

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge13.us..lr.ph.us.us.preheader_crit_edge, %.lr.ph.us.us.preheader.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge13.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge13.us.loopexit:                        ; preds = %.lr.ph12.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %.prol.loopexit80.._crit_edge13.us_crit_edge, %._crit_edge13.us.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge18.loopexit, label %._crit_edge13.us..lr.ph.us.us.preheader_crit_edge

._crit_edge13.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge13.us
  br label %.lr.ph.us.us.preheader

.lr.ph12.us.new:                                  ; preds = %.lr.ph12.us.new..lr.ph12.us.new_crit_edge, %.lr.ph12.us.new.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph12.us.new..lr.ph12.us.new_crit_edge ], [ %indvars.iv63.unr, %.lr.ph12.us.new.preheader ]
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %19 = bitcast double* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %22 = bitcast double* %21 to i64*
  store i64 %20, i64* %22, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %10
  br i1 %exitcond66.3, label %._crit_edge13.us.loopexit, label %.lr.ph12.us.new..lr.ph12.us.new_crit_edge

.lr.ph12.us.new..lr.ph12.us.new_crit_edge:        ; preds = %.lr.ph12.us.new
  br label %.lr.ph12.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv59 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next60, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %38, align 8
  br i1 %lcmp.mod77, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %39 = load double, double* %17, align 8
  %40 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %42, 0.000000e+00
  store double %43, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  %.unr.ph = phi double [ %43, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %12, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %10
  br i1 %exitcond62, label %.lr.ph12.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %44 = phi double [ %56, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %49, %44
  store double %50, double* %38, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, %50
  store double %56, double* %38, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %10
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph12.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod82, label %.lr.ph12.us..prol.loopexit80_crit_edge, label %.prol.preheader79.preheader

.lr.ph12.us..prol.loopexit80_crit_edge:           ; preds = %.lr.ph12.us
  br label %.prol.loopexit80

.prol.preheader79.preheader:                      ; preds = %.lr.ph12.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79..prol.preheader79_crit_edge, %.prol.preheader79.preheader
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79..prol.preheader79_crit_edge ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader79..prol.preheader79_crit_edge ], [ %xtraiter81, %.prol.preheader79.preheader ]
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79..prol.preheader79_crit_edge, !llvm.loop !1

.prol.preheader79..prol.preheader79_crit_edge:    ; preds = %.prol.preheader79
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  br label %.prol.preheader79

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.lr.ph12.us..prol.loopexit80_crit_edge, %.prol.loopexit80.loopexit
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph12.us..prol.loopexit80_crit_edge ], [ %xtraiter81, %.prol.loopexit80.loopexit ]
  br i1 %13, label %.prol.loopexit80.._crit_edge13.us_crit_edge, label %.lr.ph12.us.new.preheader

.prol.loopexit80.._crit_edge13.us_crit_edge:      ; preds = %.prol.loopexit80
  br label %._crit_edge13.us

.lr.ph12.us.new.preheader:                        ; preds = %.prol.loopexit80
  br label %.lr.ph12.us.new

._crit_edge18.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge18

._crit_edge18.loopexit85:                         ; preds = %._crit_edge13.1
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %.lr.ph17.split.preheader.._crit_edge18_crit_edge, %.._crit_edge18_crit_edge, %._crit_edge18.loopexit85, %._crit_edge18.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond74, label %._crit_edge36.loopexit, label %._crit_edge18._crit_edge

._crit_edge18._crit_edge:                         ; preds = %._crit_edge18
  br label %16

._crit_edge36.loopexit:                           ; preds = %._crit_edge18
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %.._crit_edge36_crit_edge, %._crit_edge36.loopexit
  ret void

._crit_edge13.1:                                  ; preds = %._crit_edge13.1.._crit_edge13.1_crit_edge, %._crit_edge13.1.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %._crit_edge13.1.._crit_edge13.1_crit_edge ], [ %15, %._crit_edge13.1.preheader ]
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count69
  br i1 %exitcond.1, label %._crit_edge18.loopexit85, label %._crit_edge13.1.._crit_edge13.1_crit_edge

._crit_edge13.1.._crit_edge13.1_crit_edge:        ; preds = %._crit_edge13.1
  br label %._crit_edge13.1
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.lr.ph24.split.us.preheader:
  br label %.lr.ph13.us.us.preheader

.lr.ph13.us.us.preheader:                         ; preds = %._crit_edge18.us..lr.ph13.us.us.preheader_crit_edge, %.lr.ph24.split.us.preheader
  %indvars.iv59 = phi i64 [ 0, %.lr.ph24.split.us.preheader ], [ %indvars.iv.next60, %._crit_edge18.us..lr.ph13.us.us.preheader_crit_edge ]
  br label %.lr.ph13.us.us.new

._crit_edge18.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond62, label %.lr.ph6.split.us.new.preheader, label %._crit_edge18.us..lr.ph13.us.us.preheader_crit_edge

._crit_edge18.us..lr.ph13.us.us.preheader_crit_edge: ; preds = %._crit_edge18.us
  br label %.lr.ph13.us.us.preheader

.lr.ph6.split.us.new.preheader:                   ; preds = %._crit_edge18.us
  br label %.lr.ph6.split.us.new

.lr.ph13.us.us.new:                               ; preds = %._crit_edge14.us.us..lr.ph13.us.us.new_crit_edge, %.lr.ph13.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %.lr.ph13.us.us.preheader ], [ %indvars.iv.next56, %._crit_edge14.us.us..lr.ph13.us.us.new_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv55, %indvars.iv59
  br label %3

._crit_edge14.us.us:                              ; preds = %3
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge18.us, label %._crit_edge14.us.us..lr.ph13.us.us.new_crit_edge

._crit_edge14.us.us..lr.ph13.us.us.new_crit_edge: ; preds = %._crit_edge14.us.us
  br label %.lr.ph13.us.us.new

; <label>:3:                                      ; preds = %._crit_edge, %.lr.ph13.us.us.new
  %indvars.iv51 = phi i64 [ 0, %.lr.ph13.us.us.new ], [ %indvars.iv.next52.1, %._crit_edge ]
  %4 = add nuw nsw i64 %2, %indvars.iv51
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next52
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge14.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %3

.lr.ph6.split.us.new:                             ; preds = %._crit_edge.us..lr.ph6.split.us.new_crit_edge, %.lr.ph6.split.us.new.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us..lr.ph6.split.us.new_crit_edge ], [ 0, %.lr.ph6.split.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %._crit_edge1, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ 0, %.lr.ph6.split.us.new ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv45
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv45
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %17
  br label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond48, label %._crit_edge7, label %._crit_edge.us..lr.ph6.split.us.new_crit_edge

._crit_edge.us..lr.ph6.split.us.new_crit_edge:    ; preds = %._crit_edge.us
  br label %.lr.ph6.split.us.new

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.lr.ph13.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge7.us..lr.ph.us.us.preheader_crit_edge, %.lr.ph13.split.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.lr.ph13.split.us.preheader ], [ %indvars.iv.next41, %._crit_edge7.us..lr.ph.us.us.preheader_crit_edge ]
  %5 = mul nsw i64 %indvars.iv40, 140
  br label %.lr.ph.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge4.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 150
  br i1 %exitcond43, label %._crit_edge14, label %._crit_edge7.us..lr.ph.us.us.preheader_crit_edge

._crit_edge7.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge7.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge4.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next37, %._crit_edge4.us.us..lr.ph.us.us_crit_edge ]
  %6 = add i64 %indvars.iv36, %5
  %sext = mul i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 140
  br i1 %exitcond39, label %._crit_edge7.us, label %._crit_edge4.us.us..lr.ph.us.us_crit_edge

._crit_edge4.us.us..lr.ph.us.us_crit_edge:        ; preds = %._crit_edge4.us.us
  br label %.lr.ph.us.us

; <label>:8:                                      ; preds = %._crit_edge.us.us._crit_edge, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us._crit_edge ], [ 0, %.lr.ph.us.us ]
  %9 = add i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.._crit_edge.us.us_crit_edge

.._crit_edge.us.us_crit_edge:                     ; preds = %8
  br label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.._crit_edge.us.us_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond35, label %._crit_edge4.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us
  br label %8

._crit_edge14:                                    ; preds = %._crit_edge7.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
