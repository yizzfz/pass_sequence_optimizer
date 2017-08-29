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
  %7 = bitcast double* %5 to i8*
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader16.lr.ph, label %._crit_edge31

.preheader16.lr.ph:                               ; preds = %6
  %wide.trip.count = zext i32 %2 to i64
  %12 = add nsw i64 %8, -1
  %13 = shl nsw i64 %8, 3
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  %16 = icmp eq i32 %2, 0
  %xtraiter51 = and i64 %wide.trip.count, 1
  %lcmp.mod52 = icmp eq i64 %xtraiter51, 0
  %17 = icmp eq i32 %2, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %xtraiter57 = and i64 %8, 3
  %lcmp.mod58 = icmp eq i64 %xtraiter57, 0
  %18 = icmp ult i64 %12, 3
  %19 = add nsw i64 %9, -1
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %19, 7
  br label %.preheader16

.preheader16:                                     ; preds = %._crit_edge28, %.preheader16.lr.ph
  %indvars.iv1329 = phi i64 [ 0, %.preheader16.lr.ph ], [ %indvars.iv.next14, %._crit_edge28 ]
  br i1 %14, label %.preheader15.lr.ph, label %._crit_edge28

.preheader15.lr.ph:                               ; preds = %.preheader16
  br i1 %15, label %.preheader15.us.preheader, label %.preheader15.preheader

.preheader15.preheader:                           ; preds = %.preheader15.lr.ph
  br i1 %lcmp.mod, label %.preheader15.prol.loopexit, label %.preheader15.prol.preheader

.preheader15.prol.preheader:                      ; preds = %.preheader15.preheader
  br label %.preheader15.prol

.preheader15.prol:                                ; preds = %.preheader15.prol, %.preheader15.prol.preheader
  %indvars.iv1125.prol = phi i64 [ %indvars.iv.next12.prol, %.preheader15.prol ], [ 0, %.preheader15.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader15.prol ], [ %xtraiter, %.preheader15.prol.preheader ]
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv1125.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader15.prol.loopexit.unr-lcssa, label %.preheader15.prol, !llvm.loop !1

.preheader15.prol.loopexit.unr-lcssa:             ; preds = %.preheader15.prol
  br label %.preheader15.prol.loopexit

.preheader15.prol.loopexit:                       ; preds = %.preheader15.preheader, %.preheader15.prol.loopexit.unr-lcssa
  %indvars.iv1125.unr = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next12.prol, %.preheader15.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge28.loopexit69, label %.preheader15.preheader.new

.preheader15.preheader.new:                       ; preds = %.preheader15.prol.loopexit
  br label %.preheader15

.preheader15.us.preheader:                        ; preds = %.preheader15.lr.ph
  br label %.preheader15.us

.preheader15.us:                                  ; preds = %.preheader15.us.preheader, %._crit_edge24.us
  %indvars.iv1125.us = phi i64 [ %indvars.iv.next12.us, %._crit_edge24.us ], [ 0, %.preheader15.us.preheader ]
  br i1 %16, label %.preheader.us.thread, label %.lr.ph.us33.preheader

.lr.ph.us33.preheader:                            ; preds = %.preheader15.us
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 0
  br label %.lr.ph.us33

.lr.ph.us33:                                      ; preds = %.lr.ph.us33.preheader, %._crit_edge.us40
  %indvars.iv719.us32 = phi i64 [ %indvars.iv.next8.us42, %._crit_edge.us40 ], [ 0, %.lr.ph.us33.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv719.us32
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod52, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us33
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv719.us32
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %sunkaddr45.prol = shl nuw nsw i64 %indvars.iv719.us32, 3
  %sunkaddr46.prol = add i64 %sunkaddr, %sunkaddr45.prol
  %sunkaddr47.prol = inttoptr i64 %sunkaddr46.prol to double*
  %27 = load double, double* %sunkaddr47.prol, align 8
  %28 = fadd double %27, %26
  store double %28, double* %sunkaddr47.prol, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us33
  %indvars.iv18.us37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us33 ]
  br i1 %17, label %._crit_edge.us40, label %.lr.ph.us33.new.preheader

.lr.ph.us33.new.preheader:                        ; preds = %.prol.loopexit
  %sunkaddr45 = shl nuw nsw i64 %indvars.iv719.us32, 3
  %sunkaddr46 = add i64 %sunkaddr, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %.pre = load double, double* %sunkaddr47, align 8
  br label %.lr.ph.us33.new

.lr.ph.us33.new:                                  ; preds = %.lr.ph.us33.new.preheader, %.lr.ph.us33.new
  %29 = phi double [ %41, %.lr.ph.us33.new ], [ %.pre, %.lr.ph.us33.new.preheader ]
  %indvars.iv18.us37 = phi i64 [ %indvars.iv.next.us38.1, %.lr.ph.us33.new ], [ %indvars.iv18.us37.unr.ph, %.lr.ph.us33.new.preheader ]
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv18.us37
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv18.us37, i64 %indvars.iv719.us32
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr47, align 8
  %indvars.iv.next.us38 = add nuw nsw i64 %indvars.iv18.us37, 1
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv.next.us38
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us38, i64 %indvars.iv719.us32
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %sunkaddr47, align 8
  %indvars.iv.next.us38.1 = add nuw nsw i64 %indvars.iv18.us37, 2
  %exitcond.us39.1 = icmp eq i64 %indvars.iv.next.us38.1, %wide.trip.count
  br i1 %exitcond.us39.1, label %._crit_edge.us40.loopexit, label %.lr.ph.us33.new

._crit_edge.us40.loopexit:                        ; preds = %.lr.ph.us33.new
  br label %._crit_edge.us40

._crit_edge.us40:                                 ; preds = %._crit_edge.us40.loopexit, %.prol.loopexit
  %indvars.iv.next8.us42 = add nuw nsw i64 %indvars.iv719.us32, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next8.us42, %8
  br i1 %exitcond53, label %.lr.ph23.us.preheader, label %.lr.ph.us33

.preheader.us.thread:                             ; preds = %.preheader15.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %13, i32 8, i1 false)
  br label %._crit_edge24.us

.lr.ph23.us.preheader:                            ; preds = %._crit_edge.us40
  br i1 %lcmp.mod58, label %.lr.ph23.us.prol.loopexit, label %.lr.ph23.us.prol.preheader

.lr.ph23.us.prol.preheader:                       ; preds = %.lr.ph23.us.preheader
  br label %.lr.ph23.us.prol

.lr.ph23.us.prol:                                 ; preds = %.lr.ph23.us.prol.preheader, %.lr.ph23.us.prol
  %indvars.iv922.us.prol = phi i64 [ %indvars.iv.next10.us.prol, %.lr.ph23.us.prol ], [ 0, %.lr.ph23.us.prol.preheader ]
  %prol.iter59 = phi i64 [ %prol.iter59.sub, %.lr.ph23.us.prol ], [ %xtraiter57, %.lr.ph23.us.prol.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv922.us.prol
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv922.us.prol
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next10.us.prol = add nuw nsw i64 %indvars.iv922.us.prol, 1
  %prol.iter59.sub = add nsw i64 %prol.iter59, -1
  %prol.iter59.cmp = icmp eq i64 %prol.iter59.sub, 0
  br i1 %prol.iter59.cmp, label %.lr.ph23.us.prol.loopexit.loopexit, label %.lr.ph23.us.prol, !llvm.loop !3

.lr.ph23.us.prol.loopexit.loopexit:               ; preds = %.lr.ph23.us.prol
  br label %.lr.ph23.us.prol.loopexit

.lr.ph23.us.prol.loopexit:                        ; preds = %.lr.ph23.us.prol.loopexit.loopexit, %.lr.ph23.us.preheader
  %indvars.iv922.us.unr = phi i64 [ 0, %.lr.ph23.us.preheader ], [ %xtraiter57, %.lr.ph23.us.prol.loopexit.loopexit ]
  br i1 %18, label %._crit_edge24.us, label %.lr.ph23.us.preheader68

.lr.ph23.us.preheader68:                          ; preds = %.lr.ph23.us.prol.loopexit
  br label %.lr.ph23.us

.lr.ph23.us:                                      ; preds = %.lr.ph23.us.preheader68, %.lr.ph23.us
  %indvars.iv922.us = phi i64 [ %indvars.iv.next10.us.3, %.lr.ph23.us ], [ %indvars.iv922.us.unr, %.lr.ph23.us.preheader68 ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv922.us
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv922.us
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv922.us, 1
  %52 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next10.us
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv.next10.us
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next10.us.1 = add nsw i64 %indvars.iv922.us, 2
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next10.us.1
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv.next10.us.1
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next10.us.2 = add nsw i64 %indvars.iv922.us, 3
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next10.us.2
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1329, i64 %indvars.iv1125.us, i64 %indvars.iv.next10.us.2
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next10.us.3 = add nuw nsw i64 %indvars.iv922.us, 4
  %exitcond55.3 = icmp eq i64 %indvars.iv.next10.us.3, %8
  br i1 %exitcond55.3, label %._crit_edge24.us.loopexit, label %.lr.ph23.us

._crit_edge24.us.loopexit:                        ; preds = %.lr.ph23.us
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.lr.ph23.us.prol.loopexit, %.preheader.us.thread
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1125.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next12.us, %9
  br i1 %exitcond60, label %._crit_edge28.loopexit, label %.preheader15.us

.preheader15:                                     ; preds = %.preheader15, %.preheader15.preheader.new
  %indvars.iv1125 = phi i64 [ %indvars.iv1125.unr, %.preheader15.preheader.new ], [ %indvars.iv.next12.7, %.preheader15 ]
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv1125, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next12.7, %9
  br i1 %exitcond.7, label %._crit_edge28.loopexit69.unr-lcssa, label %.preheader15

._crit_edge28.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge28

._crit_edge28.loopexit69.unr-lcssa:               ; preds = %.preheader15
  br label %._crit_edge28.loopexit69

._crit_edge28.loopexit69:                         ; preds = %.preheader15.prol.loopexit, %._crit_edge28.loopexit69.unr-lcssa
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit69, %._crit_edge28.loopexit, %.preheader16
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1329, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next14, %10
  br i1 %exitcond61, label %._crit_edge31.loopexit, label %.preheader16

._crit_edge31.loopexit:                           ; preds = %._crit_edge28
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader13.lr.ph, label %._crit_edge27

.preheader13.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader13.us.preheader, label %._crit_edge27

.preheader13.us.preheader:                        ; preds = %.preheader13.lr.ph
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %.preheader13.us.preheader, %._crit_edge24.us
  %indvars.iv1025.us = phi i64 [ %indvars.iv.next11.us, %._crit_edge24.us ], [ 0, %.preheader13.us.preheader ]
  br i1 true, label %.preheader12.us.us.preheader, label %._crit_edge24.us

.preheader12.us.us.preheader:                     ; preds = %.preheader13.us
  br label %.preheader12.us.us

._crit_edge24.us.loopexit:                        ; preds = %._crit_edge21.us.us
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.preheader13.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1025.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next11.us, 150
  br i1 %exitcond47, label %._crit_edge27.loopexit, label %.preheader13.us

.preheader12.us.us:                               ; preds = %.preheader12.us.us.preheader, %._crit_edge21.us.us
  %indvars.iv822.us.us = phi i64 [ %indvars.iv.next9.us.us, %._crit_edge21.us.us ], [ 0, %.preheader12.us.us.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv822.us.us, %indvars.iv1025.us
  br i1 true, label %.prol.loopexit43, label %.prol.preheader42

.prol.preheader42:                                ; preds = %.preheader12.us.us
  br label %.prol.loopexit43

.prol.loopexit43:                                 ; preds = %.prol.preheader42, %.preheader12.us.us
  %indvars.iv619.us.us.unr.ph = phi i64 [ 1, %.prol.preheader42 ], [ 0, %.preheader12.us.us ]
  br i1 false, label %._crit_edge21.us.us, label %.preheader12.us.us.new.preheader

.preheader12.us.us.new.preheader:                 ; preds = %.prol.loopexit43
  br label %.preheader12.us.us.new

._crit_edge21.us.us.loopexit:                     ; preds = %.preheader12.us.us.new
  br label %._crit_edge21.us.us

._crit_edge21.us.us:                              ; preds = %._crit_edge21.us.us.loopexit, %.prol.loopexit43
  %indvars.iv.next9.us.us = add nuw nsw i64 %indvars.iv822.us.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next9.us.us, 140
  br i1 %exitcond46, label %._crit_edge24.us.loopexit, label %.preheader12.us.us

.preheader12.us.us.new:                           ; preds = %.preheader12.us.us.new.preheader, %.preheader12.us.us.new
  %indvars.iv619.us.us = phi i64 [ %indvars.iv.next7.us.us.1, %.preheader12.us.us.new ], [ %indvars.iv619.us.us.unr.ph, %.preheader12.us.us.new.preheader ]
  %7 = add nuw nsw i64 %indvars.iv619.us.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1025.us, i64 %indvars.iv822.us.us, i64 %indvars.iv619.us.us
  %indvars.iv.next7.us.us = add nuw nsw i64 %indvars.iv619.us.us, 1
  %12 = add nuw nsw i64 %indvars.iv.next7.us.us, %6
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next7.us.us.1 = add nuw nsw i64 %indvars.iv619.us.us, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next7.us.us.1, 160
  br i1 %exitcond41.1, label %._crit_edge21.us.us.loopexit, label %.preheader12.us.us.new

._crit_edge27.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.preheader13.lr.ph, %5
  br i1 true, label %.preheader.lr.ph, label %._crit_edge18

.preheader.lr.ph:                                 ; preds = %._crit_edge27
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv416 = phi i64 [ %indvars.iv.next5, %._crit_edge ], [ 0, %.preheader.lr.ph ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv15.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 false, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv15 = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv15.unr.ph, %.preheader.new.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv15, %indvars.iv416
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 160
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv416, i64 %indvars.iv15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %25 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv416
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 160
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.600000e+02, double 1.600000e+02>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv416, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 160
  br i1 %exitcond, label %._crit_edge18.loopexit, label %.preheader

._crit_edge18.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %._crit_edge27
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader7.lr.ph, label %._crit_edge14

.preheader7.lr.ph:                                ; preds = %4
  br i1 true, label %.preheader7.us.preheader, label %._crit_edge14

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge11.us
  %indvars.iv512.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge11.us ], [ 0, %.preheader7.us.preheader ]
  %9 = mul nuw nsw i64 %indvars.iv512.us, 22400
  br i1 true, label %.preheader.us.us.preheader, label %._crit_edge11.us

.preheader.us.us.preheader:                       ; preds = %.preheader7.us
  br label %.preheader.us.us

._crit_edge11.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %.preheader7.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv512.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next6.us, 150
  br i1 %exitcond29, label %._crit_edge14.loopexit, label %.preheader7.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv39.us.us = phi i64 [ %indvars.iv.next4.us.us, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %10 = mul nuw nsw i64 %indvars.iv39.us.us, 160
  %11 = add nuw nsw i64 %10, %9
  br label %12

._crit_edge.us.us:                                ; preds = %19
  %indvars.iv.next4.us.us = add nuw nsw i64 %indvars.iv39.us.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next4.us.us, 140
  br i1 %exitcond28, label %._crit_edge11.us.loopexit, label %.preheader.us.us

; <label>:12:                                     ; preds = %19, %.preheader.us.us
  %indvars.iv8.us.us = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.us.us, %19 ]
  %13 = add nuw nsw i64 %11, %indvars.iv8.us.us
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv512.us, i64 %indvars.iv39.us.us, i64 %indvars.iv8.us.us
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv8.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond, label %._crit_edge.us.us, label %12

._crit_edge14.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader7.lr.ph, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
