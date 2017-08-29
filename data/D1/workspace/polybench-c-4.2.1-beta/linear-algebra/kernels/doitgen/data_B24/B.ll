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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge31

.preheader6.lr.ph:                                ; preds = %6
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
  %15 = add nsw i64 %wide.trip.count69, -2
  %16 = and i32 %1, 1
  %17 = zext i32 %16 to i64
  %18 = sub nsw i64 %15, %17
  %19 = lshr i64 %18, 1
  %20 = add nuw i64 %19, 1
  %21 = zext i32 %xtraiter to i64
  %xtraiter86 = and i64 %20, 7
  %lcmp.mod = icmp eq i64 %xtraiter86, 0
  %22 = icmp ult i64 %18, 14
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %.preheader6.lr.ph
  %indvars.iv71 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next72, %._crit_edge15 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge15

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.lr.ph.us.us.preheader.preheader, label %.preheader5.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader5.lr.ph
  br label %.lr.ph.us.us.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %14, label %._crit_edge15, label %._crit_edge12.1.preheader

._crit_edge12.1.preheader:                        ; preds = %.preheader5.preheader
  br i1 %lcmp.mod, label %._crit_edge12.1.prol.loopexit, label %._crit_edge12.1.prol.preheader

._crit_edge12.1.prol.preheader:                   ; preds = %._crit_edge12.1.preheader
  br label %._crit_edge12.1.prol

._crit_edge12.1.prol:                             ; preds = %._crit_edge12.1.prol, %._crit_edge12.1.prol.preheader
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.1.prol, %._crit_edge12.1.prol ], [ %21, %._crit_edge12.1.prol.preheader ]
  %prol.iter87 = phi i64 [ %prol.iter87.sub, %._crit_edge12.1.prol ], [ %xtraiter86, %._crit_edge12.1.prol.preheader ]
  %indvars.iv.next50.1.prol = add nuw nsw i64 %indvars.iv49.prol, 2
  %prol.iter87.sub = add i64 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i64 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %._crit_edge12.1.prol.loopexit.unr-lcssa, label %._crit_edge12.1.prol, !llvm.loop !1

._crit_edge12.1.prol.loopexit.unr-lcssa:          ; preds = %._crit_edge12.1.prol
  br label %._crit_edge12.1.prol.loopexit

._crit_edge12.1.prol.loopexit:                    ; preds = %._crit_edge12.1.preheader, %._crit_edge12.1.prol.loopexit.unr-lcssa
  %indvars.iv49.unr = phi i64 [ %21, %._crit_edge12.1.preheader ], [ %indvars.iv.next50.1.prol, %._crit_edge12.1.prol.loopexit.unr-lcssa ]
  br i1 %22, label %._crit_edge15.loopexit85, label %._crit_edge12.1.preheader.new

._crit_edge12.1.preheader.new:                    ; preds = %._crit_edge12.1.prol.loopexit
  br label %._crit_edge12.1

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge12.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit80
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge15.loopexit, label %.lr.ph.us.us.preheader

.lr.ph11.us.new:                                  ; preds = %.lr.ph11.us.new.preheader, %.lr.ph11.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph11.us.new ], [ %indvars.iv63.unr, %.lr.ph11.us.new.preheader ]
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next64.3 = add nuw nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %10
  br i1 %exitcond66.3, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv59 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next60, %._crit_edge.us.us ]
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %44, align 8
  br i1 %lcmp.mod77, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %45 = load double, double* %23, align 8
  %46 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %48, 0.000000e+00
  store double %49, double* %44, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %49, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %10
  br i1 %exitcond62, label %.lr.ph11.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %50 = phi double [ %62, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, %50
  store double %56, double* %44, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %61, %56
  store double %62, double* %44, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %10
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph11.us:                                      ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod82, label %.prol.loopexit80, label %.prol.preheader79.preheader

.prol.preheader79.preheader:                      ; preds = %.lr.ph11.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79.preheader, %.prol.preheader79
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79 ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader79 ], [ %xtraiter81, %.prol.preheader79.preheader ]
  %63 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79, !llvm.loop !3

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.loopexit80.loopexit, %.lr.ph11.us
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph11.us ], [ %xtraiter81, %.prol.loopexit80.loopexit ]
  br i1 %13, label %._crit_edge12.us, label %.lr.ph11.us.new.preheader

.lr.ph11.us.new.preheader:                        ; preds = %.prol.loopexit80
  br label %.lr.ph11.us.new

._crit_edge15.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge15

._crit_edge15.loopexit85.unr-lcssa:               ; preds = %._crit_edge12.1
  br label %._crit_edge15.loopexit85

._crit_edge15.loopexit85:                         ; preds = %._crit_edge12.1.prol.loopexit, %._crit_edge15.loopexit85.unr-lcssa
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit85, %._crit_edge15.loopexit, %.preheader5.preheader, %.preheader6
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond74, label %._crit_edge31.loopexit, label %.preheader6

._crit_edge31.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
  ret void

._crit_edge12.1:                                  ; preds = %._crit_edge12.1, %._crit_edge12.1.preheader.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr, %._crit_edge12.1.preheader.new ], [ %indvars.iv.next50.1.7, %._crit_edge12.1 ]
  %indvars.iv.next50.1.7 = add nsw i64 %indvars.iv49, 16
  %exitcond.1.7 = icmp eq i64 %indvars.iv.next50.1.7, %wide.trip.count69
  br i1 %exitcond.1.7, label %._crit_edge15.loopexit85.unr-lcssa, label %._crit_edge12.1
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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader7.us.preheader:
  br label %.preheader6.us.us.preheader

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us.preheader, %._crit_edge17.us
  %indvars.iv62 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next63, %._crit_edge17.us ]
  br label %.preheader6.us.us.new

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 150
  br i1 %exitcond65, label %.preheader.us.new.preheader, label %.preheader6.us.us.preheader

.preheader.us.new.preheader:                      ; preds = %._crit_edge17.us
  br label %.preheader.us.new

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv58 = phi i64 [ 0, %.preheader6.us.us.preheader ], [ %indvars.iv.next59, %._crit_edge14.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv58, %indvars.iv62
  br label %3

._crit_edge14.us.us:                              ; preds = %3
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 140
  br i1 %exitcond61, label %._crit_edge17.us, label %.preheader6.us.us.new

; <label>:3:                                      ; preds = %3, %.preheader6.us.us.new
  %indvars.iv54 = phi i64 [ 0, %.preheader6.us.us.new ], [ %indvars.iv.next55.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv54
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv54
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next55
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 160
  br i1 %exitcond57.1, label %._crit_edge14.us.us, label %3

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us.new
  %indvars.iv = phi i64 [ 0, %.preheader.us.new ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv48
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv48
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
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond51, label %._crit_edge9, label %.preheader.us.new

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader3.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %indvars.iv39 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next40, %._crit_edge5.us ]
  %5 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge4.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond42, label %._crit_edge10, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge4.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge4.us.us ]
  %6 = add nuw nsw i64 %indvars.iv35, %5
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge5.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge4.us.us, label %8

._crit_edge10:                                    ; preds = %._crit_edge5.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
