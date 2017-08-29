; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %19
  %.0102 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %.0102 to double
  %4 = sext i32 %.0102 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %20 = add nsw i32 %.0102, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph167, label %._crit_edge110.._crit_edge111_crit_edge

.lr.ph167:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph167.split.us.preheader, label %.lr.ph167.split.preheader

.lr.ph167.split.us.preheader:                     ; preds = %.lr.ph167
  %xtraiter227 = and i32 %1, 1
  %lcmp.mod228 = icmp eq i32 %xtraiter227, 0
  %10 = icmp eq i32 %1, 1
  %11 = ptrtoint double* %5 to i64
  %wide.trip.count223.1 = zext i32 %1 to i64
  %12 = add nsw i64 %wide.trip.count223.1, -2
  br label %.lr.ph167.split.us

.lr.ph167.split.preheader:                        ; preds = %.lr.ph167
  %xtraiter234 = and i32 %0, 1
  %lcmp.mod235 = icmp eq i32 %xtraiter234, 0
  br i1 %lcmp.mod235, label %.lr.ph167.split.prol.loopexit, label %.lr.ph167.split.prol

.lr.ph167.split.prol:                             ; preds = %.lr.ph167.split.preheader
  %13 = fdiv double 0.000000e+00, %2
  store double %13, double* %5, align 8
  br label %.lr.ph167.split.prol.loopexit

.lr.ph167.split.prol.loopexit:                    ; preds = %.lr.ph167.split.preheader, %.lr.ph167.split.prol
  %indvars.iv230.unr = phi i64 [ 0, %.lr.ph167.split.preheader ], [ 1, %.lr.ph167.split.prol ]
  %14 = icmp eq i32 %0, 1
  br i1 %14, label %.lr.ph159, label %.lr.ph167.split.preheader240

.lr.ph167.split.preheader240:                     ; preds = %.lr.ph167.split.prol.loopexit
  %15 = ptrtoint double* %5 to i64
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count232.1 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count232.1, -2
  %18 = sub nsw i64 %17, %indvars.iv230.unr
  %19 = lshr i64 %18, 1
  %20 = and i64 %19, 1
  %lcmp.mod273 = icmp eq i64 %20, 0
  br i1 %lcmp.mod273, label %.lr.ph167.split.prol.preheader, label %.lr.ph167.split.prol.loopexit271

.lr.ph167.split.prol.preheader:                   ; preds = %.lr.ph167.split.preheader240
  br label %.lr.ph167.split.prol274

.lr.ph167.split.prol274:                          ; preds = %.lr.ph167.split.prol.preheader
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv230.unr
  %22 = bitcast double* %21 to <2 x double>*
  %sunkaddr121.prol = shl nuw nsw i64 %indvars.iv230.unr, 3
  %sunkaddr122.prol = add i64 %15, %sunkaddr121.prol
  %sunkaddr123.prol = inttoptr i64 %sunkaddr122.prol to double*
  store double %16, double* %sunkaddr123.prol, align 8
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %sunkaddr121.1.prol = add nuw nsw i64 %sunkaddr121.prol, 8
  %sunkaddr122.1.prol = add i64 %15, %sunkaddr121.1.prol
  %sunkaddr123.1.prol = inttoptr i64 %sunkaddr122.1.prol to double*
  store double %16, double* %sunkaddr123.1.prol, align 8
  %indvars.iv.next231.1.prol = or i64 %indvars.iv230.unr, 2
  br label %.lr.ph167.split.prol.loopexit271

.lr.ph167.split.prol.loopexit271:                 ; preds = %.lr.ph167.split.prol274, %.lr.ph167.split.preheader240
  %indvars.iv230.unr275 = phi i64 [ %indvars.iv230.unr, %.lr.ph167.split.preheader240 ], [ %indvars.iv.next231.1.prol, %.lr.ph167.split.prol274 ]
  %23 = icmp eq i64 %19, 0
  br i1 %23, label %.._crit_edge110_crit_edge.loopexit260, label %.lr.ph167.split.preheader240.new

.lr.ph167.split.preheader240.new:                 ; preds = %.lr.ph167.split.prol.loopexit271
  br label %.lr.ph167.split

.lr.ph167.split.us:                               ; preds = %.lr.ph167.split.us.preheader, %._crit_edge163.us
  %.0101165.us = phi i32 [ %53, %._crit_edge163.us ], [ 0, %.lr.ph167.split.us.preheader ]
  %24 = sext i32 %.0101165.us to i64
  %25 = getelementptr inbounds double, double* %5, i64 %24
  store double 0.000000e+00, double* %25, align 8
  br i1 %lcmp.mod228, label %.prol.loopexit226, label %.prol.preheader225

.prol.preheader225:                               ; preds = %.lr.ph167.split.us
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %24
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, 0.000000e+00
  %sunkaddr174.prol = shl nsw i64 %24, 3
  %sunkaddr175.prol = add i64 %11, %sunkaddr174.prol
  %sunkaddr176.prol = inttoptr i64 %sunkaddr175.prol to double*
  store double %28, double* %sunkaddr176.prol, align 8
  br label %.prol.loopexit226

.prol.loopexit226:                                ; preds = %.prol.preheader225, %.lr.ph167.split.us
  %indvars.iv221.unr.ph = phi i64 [ 1, %.prol.preheader225 ], [ 0, %.lr.ph167.split.us ]
  %.unr229.ph = phi double [ %28, %.prol.preheader225 ], [ 0.000000e+00, %.lr.ph167.split.us ]
  %.lcssa190.unr.ph = phi double [ %28, %.prol.preheader225 ], [ undef, %.lr.ph167.split.us ]
  br i1 %10, label %.prol.loopexit226.._crit_edge163.us_crit_edge, label %.lr.ph167.split.us.new.preheader

.prol.loopexit226.._crit_edge163.us_crit_edge:    ; preds = %.prol.loopexit226
  %.pre = shl nsw i64 %24, 3
  %.pre252 = add i64 %11, %.pre
  %.pre253 = inttoptr i64 %.pre252 to double*
  br label %._crit_edge163.us

.lr.ph167.split.us.new.preheader:                 ; preds = %.prol.loopexit226
  %sunkaddr174 = shl nsw i64 %24, 3
  %sunkaddr175 = add i64 %11, %sunkaddr174
  %sunkaddr176 = inttoptr i64 %sunkaddr175 to double*
  %29 = sub nsw i64 %12, %indvars.iv221.unr.ph
  %30 = lshr i64 %29, 1
  %31 = and i64 %30, 1
  %lcmp.mod267 = icmp eq i64 %31, 0
  br i1 %lcmp.mod267, label %.lr.ph167.split.us.new.prol.preheader, label %.lr.ph167.split.us.new.prol.loopexit.unr-lcssa

.lr.ph167.split.us.new.prol.preheader:            ; preds = %.lr.ph167.split.us.new.preheader
  br label %.lr.ph167.split.us.new.prol

.lr.ph167.split.us.new.prol:                      ; preds = %.lr.ph167.split.us.new.prol.preheader
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv221.unr.ph, i64 %24
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %.unr229.ph
  store double %34, double* %sunkaddr176, align 8
  %indvars.iv.next222.prol = add nuw nsw i64 %indvars.iv221.unr.ph, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next222.prol, i64 %24
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %sunkaddr176, align 8
  %indvars.iv.next222.1.prol = or i64 %indvars.iv221.unr.ph, 2
  br label %.lr.ph167.split.us.new.prol.loopexit.unr-lcssa

.lr.ph167.split.us.new.prol.loopexit.unr-lcssa:   ; preds = %.lr.ph167.split.us.new.preheader, %.lr.ph167.split.us.new.prol
  %.lcssa263.unr.ph = phi double [ %37, %.lr.ph167.split.us.new.prol ], [ undef, %.lr.ph167.split.us.new.preheader ]
  %indvars.iv221.unr.ph268 = phi i64 [ %indvars.iv.next222.1.prol, %.lr.ph167.split.us.new.prol ], [ %indvars.iv221.unr.ph, %.lr.ph167.split.us.new.preheader ]
  %.unr.ph269 = phi double [ %37, %.lr.ph167.split.us.new.prol ], [ %.unr229.ph, %.lr.ph167.split.us.new.preheader ]
  br label %.lr.ph167.split.us.new.prol.loopexit

.lr.ph167.split.us.new.prol.loopexit:             ; preds = %.lr.ph167.split.us.new.prol.loopexit.unr-lcssa
  %38 = icmp eq i64 %30, 0
  br i1 %38, label %._crit_edge163.us.loopexit, label %.lr.ph167.split.us.new.preheader.new

.lr.ph167.split.us.new.preheader.new:             ; preds = %.lr.ph167.split.us.new.prol.loopexit
  br label %.lr.ph167.split.us.new

.lr.ph167.split.us.new:                           ; preds = %.lr.ph167.split.us.new, %.lr.ph167.split.us.new.preheader.new
  %indvars.iv221 = phi i64 [ %indvars.iv221.unr.ph268, %.lr.ph167.split.us.new.preheader.new ], [ %indvars.iv.next222.1.1, %.lr.ph167.split.us.new ]
  %39 = phi double [ %.unr.ph269, %.lr.ph167.split.us.new.preheader.new ], [ %51, %.lr.ph167.split.us.new ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv221, i64 %24
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  store double %42, double* %sunkaddr176, align 8
  %indvars.iv.next222 = add nuw nsw i64 %indvars.iv221, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next222, i64 %24
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %sunkaddr176, align 8
  %indvars.iv.next222.1 = add nsw i64 %indvars.iv221, 2
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next222.1, i64 %24
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %sunkaddr176, align 8
  %indvars.iv.next222.1270 = add nsw i64 %indvars.iv221, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next222.1270, i64 %24
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %sunkaddr176, align 8
  %indvars.iv.next222.1.1 = add nsw i64 %indvars.iv221, 4
  %exitcond224.1.1 = icmp eq i64 %indvars.iv.next222.1.1, %wide.trip.count223.1
  br i1 %exitcond224.1.1, label %._crit_edge163.us.loopexit.unr-lcssa, label %.lr.ph167.split.us.new

._crit_edge163.us.loopexit.unr-lcssa:             ; preds = %.lr.ph167.split.us.new
  br label %._crit_edge163.us.loopexit

._crit_edge163.us.loopexit:                       ; preds = %.lr.ph167.split.us.new.prol.loopexit, %._crit_edge163.us.loopexit.unr-lcssa
  %.lcssa263 = phi double [ %.lcssa263.unr.ph, %.lr.ph167.split.us.new.prol.loopexit ], [ %51, %._crit_edge163.us.loopexit.unr-lcssa ]
  br label %._crit_edge163.us

._crit_edge163.us:                                ; preds = %._crit_edge163.us.loopexit, %.prol.loopexit226.._crit_edge163.us_crit_edge
  %sunkaddr123.us.pre-phi = phi double* [ %.pre253, %.prol.loopexit226.._crit_edge163.us_crit_edge ], [ %sunkaddr176, %._crit_edge163.us.loopexit ]
  %.lcssa190 = phi double [ %.lcssa190.unr.ph, %.prol.loopexit226.._crit_edge163.us_crit_edge ], [ %.lcssa263, %._crit_edge163.us.loopexit ]
  %52 = fdiv double %.lcssa190, %2
  store double %52, double* %sunkaddr123.us.pre-phi, align 8
  %53 = add nsw i32 %.0101165.us, 1
  %54 = icmp slt i32 %53, %0
  br i1 %54, label %.lr.ph167.split.us, label %.._crit_edge110_crit_edge.loopexit

.._crit_edge110_crit_edge.loopexit:               ; preds = %._crit_edge163.us
  br label %.._crit_edge110_crit_edge

.._crit_edge110_crit_edge.loopexit260.unr-lcssa:  ; preds = %.lr.ph167.split
  br label %.._crit_edge110_crit_edge.loopexit260

.._crit_edge110_crit_edge.loopexit260:            ; preds = %.lr.ph167.split.prol.loopexit271, %.._crit_edge110_crit_edge.loopexit260.unr-lcssa
  br label %.._crit_edge110_crit_edge

.._crit_edge110_crit_edge:                        ; preds = %.._crit_edge110_crit_edge.loopexit260, %.._crit_edge110_crit_edge.loopexit
  br i1 true, label %.lr.ph159, label %.._crit_edge110_crit_edge.._crit_edge110.._crit_edge111_crit_edge_crit_edge

.._crit_edge110_crit_edge.._crit_edge110.._crit_edge111_crit_edge_crit_edge: ; preds = %.._crit_edge110_crit_edge
  br label %._crit_edge110.._crit_edge111_crit_edge

.lr.ph159:                                        ; preds = %.lr.ph167.split.prol.loopexit, %.._crit_edge110_crit_edge
  br i1 %9, label %.lr.ph159.split.us.preheader, label %.lr.ph159.split.preheader

.lr.ph159.split.preheader:                        ; preds = %.lr.ph159
  %55 = ptrtoint double* %6 to i64
  %56 = fdiv double 0.000000e+00, %2
  %wide.trip.count219 = zext i32 %0 to i64
  %xtraiter264 = and i64 %wide.trip.count219, 1
  %lcmp.mod265 = icmp eq i64 %xtraiter264, 0
  br i1 %lcmp.mod265, label %.lr.ph159.split.prol.loopexit, label %.lr.ph159.split.prol.preheader

.lr.ph159.split.prol.preheader:                   ; preds = %.lr.ph159.split.preheader
  br label %.lr.ph159.split.prol

.lr.ph159.split.prol:                             ; preds = %.lr.ph159.split.prol.preheader
  store double %56, double* %6, align 8
  %57 = tail call double @sqrt(double %56) #4
  %58 = fcmp ugt double %57, 1.000000e-01
  %59 = select i1 %58, double %57, double 1.000000e+00
  store double %59, double* %6, align 8
  br label %.lr.ph159.split.prol.loopexit

.lr.ph159.split.prol.loopexit:                    ; preds = %.lr.ph159.split.preheader, %.lr.ph159.split.prol
  %indvars.iv217.unr = phi i64 [ 0, %.lr.ph159.split.preheader ], [ 1, %.lr.ph159.split.prol ]
  %60 = icmp eq i32 %0, 1
  br i1 %60, label %._crit_edge110.._crit_edge111_crit_edge.loopexit259, label %.lr.ph159.split.preheader.new

.lr.ph159.split.preheader.new:                    ; preds = %.lr.ph159.split.prol.loopexit
  br label %.lr.ph159.split

.lr.ph159.split.us.preheader:                     ; preds = %.lr.ph159
  %xtraiter214 = and i32 %1, 1
  %lcmp.mod215 = icmp eq i32 %xtraiter214, 0
  %61 = icmp eq i32 %1, 1
  %62 = ptrtoint double* %6 to i64
  %sunkaddr177 = ptrtoint double* %5 to i64
  %wide.trip.count210.1 = zext i32 %1 to i64
  br label %.lr.ph159.split.us

.lr.ph159.split.us:                               ; preds = %.lr.ph159.split.us.preheader, %._crit_edge156.us
  %.1102158.us = phi i32 [ %88, %._crit_edge156.us ], [ 0, %.lr.ph159.split.us.preheader ]
  %63 = sext i32 %.1102158.us to i64
  %64 = getelementptr inbounds double, double* %6, i64 %63
  store double 0.000000e+00, double* %64, align 8
  br i1 %lcmp.mod215, label %.prol.loopexit213, label %.prol.preheader212

.prol.preheader212:                               ; preds = %.lr.ph159.split.us
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %63
  %66 = load double, double* %65, align 8
  %sunkaddr178.prol = shl nsw i64 %63, 3
  %sunkaddr179.prol = add i64 %sunkaddr177, %sunkaddr178.prol
  %sunkaddr180.prol = inttoptr i64 %sunkaddr179.prol to double*
  %67 = load double, double* %sunkaddr180.prol, align 8
  %68 = fsub double %66, %67
  %69 = fmul double %68, %68
  %70 = fadd double %69, 0.000000e+00
  %sunkaddr183.prol = add i64 %62, %sunkaddr178.prol
  %sunkaddr184.prol = inttoptr i64 %sunkaddr183.prol to double*
  store double %70, double* %sunkaddr184.prol, align 8
  br label %.prol.loopexit213

.prol.loopexit213:                                ; preds = %.prol.preheader212, %.lr.ph159.split.us
  %indvars.iv208.unr.ph = phi i64 [ 1, %.prol.preheader212 ], [ 0, %.lr.ph159.split.us ]
  %.unr216.ph = phi double [ %70, %.prol.preheader212 ], [ 0.000000e+00, %.lr.ph159.split.us ]
  %.lcssa189.unr.ph = phi double [ %70, %.prol.preheader212 ], [ undef, %.lr.ph159.split.us ]
  br i1 %61, label %.prol.loopexit213.._crit_edge156.us_crit_edge, label %.lr.ph159.split.us.new.preheader

.prol.loopexit213.._crit_edge156.us_crit_edge:    ; preds = %.prol.loopexit213
  %.pre254 = shl nsw i64 %63, 3
  %.pre255 = add i64 %62, %.pre254
  %.pre256 = inttoptr i64 %.pre255 to double*
  br label %._crit_edge156.us

.lr.ph159.split.us.new.preheader:                 ; preds = %.prol.loopexit213
  %sunkaddr178 = shl nsw i64 %63, 3
  %sunkaddr179 = add i64 %sunkaddr177, %sunkaddr178
  %sunkaddr180 = inttoptr i64 %sunkaddr179 to double*
  %sunkaddr183 = add i64 %62, %sunkaddr178
  %sunkaddr184 = inttoptr i64 %sunkaddr183 to double*
  br label %.lr.ph159.split.us.new

.lr.ph159.split.us.new:                           ; preds = %.lr.ph159.split.us.new.preheader, %.lr.ph159.split.us.new
  %indvars.iv208 = phi i64 [ %indvars.iv.next209.1, %.lr.ph159.split.us.new ], [ %indvars.iv208.unr.ph, %.lr.ph159.split.us.new.preheader ]
  %71 = phi double [ %83, %.lr.ph159.split.us.new ], [ %.unr216.ph, %.lr.ph159.split.us.new.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv208, i64 %63
  %73 = load double, double* %72, align 8
  %74 = load double, double* %sunkaddr180, align 8
  %75 = fsub double %73, %74
  %76 = fmul double %75, %75
  %77 = fadd double %71, %76
  store double %77, double* %sunkaddr184, align 8
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next209, i64 %63
  %79 = load double, double* %78, align 8
  %80 = load double, double* %sunkaddr180, align 8
  %81 = fsub double %79, %80
  %82 = fmul double %81, %81
  %83 = fadd double %77, %82
  store double %83, double* %sunkaddr184, align 8
  %indvars.iv.next209.1 = add nsw i64 %indvars.iv208, 2
  %exitcond211.1 = icmp eq i64 %indvars.iv.next209.1, %wide.trip.count210.1
  br i1 %exitcond211.1, label %._crit_edge156.us.loopexit, label %.lr.ph159.split.us.new

._crit_edge156.us.loopexit:                       ; preds = %.lr.ph159.split.us.new
  br label %._crit_edge156.us

._crit_edge156.us:                                ; preds = %._crit_edge156.us.loopexit, %.prol.loopexit213.._crit_edge156.us_crit_edge
  %sunkaddr131.us.pre-phi = phi double* [ %.pre256, %.prol.loopexit213.._crit_edge156.us_crit_edge ], [ %sunkaddr184, %._crit_edge156.us.loopexit ]
  %.lcssa189 = phi double [ %.lcssa189.unr.ph, %.prol.loopexit213.._crit_edge156.us_crit_edge ], [ %83, %._crit_edge156.us.loopexit ]
  %84 = fdiv double %.lcssa189, %2
  store double %84, double* %sunkaddr131.us.pre-phi, align 8
  %85 = tail call double @sqrt(double %84) #4
  %86 = fcmp ugt double %85, 1.000000e-01
  %87 = select i1 %86, double %85, double 1.000000e+00
  store double %87, double* %sunkaddr131.us.pre-phi, align 8
  %88 = add nsw i32 %.1102158.us, 1
  %89 = icmp slt i32 %88, %0
  br i1 %89, label %.lr.ph159.split.us, label %._crit_edge110.._crit_edge111_crit_edge.loopexit

.lr.ph167.split:                                  ; preds = %.lr.ph167.split, %.lr.ph167.split.preheader240.new
  %indvars.iv230 = phi i64 [ %indvars.iv230.unr275, %.lr.ph167.split.preheader240.new ], [ %indvars.iv.next231.1.1, %.lr.ph167.split ]
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv230
  %91 = bitcast double* %90 to <2 x double>*
  %sunkaddr121 = shl i64 %indvars.iv230, 3
  %sunkaddr122 = add i64 %15, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to double*
  store double %16, double* %sunkaddr123, align 8
  store <2 x double> zeroinitializer, <2 x double>* %91, align 8
  %sunkaddr121.1 = add i64 %sunkaddr121, 8
  %sunkaddr122.1 = add i64 %15, %sunkaddr121.1
  %sunkaddr123.1 = inttoptr i64 %sunkaddr122.1 to double*
  store double %16, double* %sunkaddr123.1, align 8
  %indvars.iv.next231.1 = add nsw i64 %indvars.iv230, 2
  %92 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next231.1
  %93 = bitcast double* %92 to <2 x double>*
  %sunkaddr121.1276 = shl i64 %indvars.iv.next231.1, 3
  %sunkaddr122.1277 = add i64 %15, %sunkaddr121.1276
  %sunkaddr123.1278 = inttoptr i64 %sunkaddr122.1277 to double*
  store double %16, double* %sunkaddr123.1278, align 8
  store <2 x double> zeroinitializer, <2 x double>* %93, align 8
  %sunkaddr121.1.1 = add i64 %sunkaddr121.1276, 8
  %sunkaddr122.1.1 = add i64 %15, %sunkaddr121.1.1
  %sunkaddr123.1.1 = inttoptr i64 %sunkaddr122.1.1 to double*
  store double %16, double* %sunkaddr123.1.1, align 8
  %indvars.iv.next231.1.1 = add nsw i64 %indvars.iv230, 4
  %exitcond233.1.1 = icmp eq i64 %indvars.iv.next231.1.1, %wide.trip.count232.1
  br i1 %exitcond233.1.1, label %.._crit_edge110_crit_edge.loopexit260.unr-lcssa, label %.lr.ph167.split

._crit_edge110.._crit_edge111_crit_edge.loopexit: ; preds = %._crit_edge156.us
  br label %._crit_edge110.._crit_edge111_crit_edge

._crit_edge110.._crit_edge111_crit_edge.loopexit259.unr-lcssa: ; preds = %.lr.ph159.split
  br label %._crit_edge110.._crit_edge111_crit_edge.loopexit259

._crit_edge110.._crit_edge111_crit_edge.loopexit259: ; preds = %.lr.ph159.split.prol.loopexit, %._crit_edge110.._crit_edge111_crit_edge.loopexit259.unr-lcssa
  br label %._crit_edge110.._crit_edge111_crit_edge

._crit_edge110.._crit_edge111_crit_edge:          ; preds = %._crit_edge110.._crit_edge111_crit_edge.loopexit259, %._crit_edge110.._crit_edge111_crit_edge.loopexit, %.._crit_edge110_crit_edge.._crit_edge110.._crit_edge111_crit_edge_crit_edge, %7
  %94 = icmp sgt i32 %1, 0
  br i1 %94, label %._crit_edge111.._crit_edge112_crit_edge.lr.ph, label %._crit_edge111.._crit_edge113_crit_edge

._crit_edge111.._crit_edge112_crit_edge.lr.ph:    ; preds = %._crit_edge110.._crit_edge111_crit_edge
  br i1 %8, label %._crit_edge111.._crit_edge112_crit_edge.us.preheader, label %._crit_edge113._crit_edge

._crit_edge111.._crit_edge112_crit_edge.us.preheader: ; preds = %._crit_edge111.._crit_edge112_crit_edge.lr.ph
  %wide.trip.count205 = zext i32 %0 to i64
  br label %._crit_edge111.._crit_edge112_crit_edge.us

._crit_edge111.._crit_edge112_crit_edge.us:       ; preds = %._crit_edge111.._crit_edge112_crit_edge.us.preheader, %._crit_edge112._crit_edge.us
  %.2152.us = phi i32 [ %107, %._crit_edge112._crit_edge.us ], [ 0, %._crit_edge111.._crit_edge112_crit_edge.us.preheader ]
  %95 = sext i32 %.2152.us to i64
  br label %._crit_edge112.us

._crit_edge112.us:                                ; preds = %._crit_edge112.us, %._crit_edge111.._crit_edge112_crit_edge.us
  %indvars.iv203 = phi i64 [ 0, %._crit_edge111.._crit_edge112_crit_edge.us ], [ %indvars.iv.next204, %._crit_edge112.us ]
  %96 = getelementptr inbounds double, double* %5, i64 %indvars.iv203
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %95, i64 %indvars.iv203
  %99 = load double, double* %98, align 8
  %100 = fsub double %99, %97
  store double %100, double* %98, align 8
  %101 = tail call double @sqrt(double %2) #4
  %102 = getelementptr inbounds double, double* %6, i64 %indvars.iv203
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = load double, double* %98, align 8
  %106 = fdiv double %105, %104
  store double %106, double* %98, align 8
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond206 = icmp eq i64 %indvars.iv.next204, %wide.trip.count205
  br i1 %exitcond206, label %._crit_edge112._crit_edge.us, label %._crit_edge112.us

._crit_edge112._crit_edge.us:                     ; preds = %._crit_edge112.us
  %107 = add nsw i32 %.2152.us, 1
  %108 = icmp slt i32 %107, %1
  br i1 %108, label %._crit_edge111.._crit_edge112_crit_edge.us, label %._crit_edge111.._crit_edge113_crit_edge.loopexit

.lr.ph159.split:                                  ; preds = %.lr.ph159.split, %.lr.ph159.split.preheader.new
  %indvars.iv217 = phi i64 [ %indvars.iv217.unr, %.lr.ph159.split.preheader.new ], [ %indvars.iv.next218.1, %.lr.ph159.split ]
  %109 = getelementptr inbounds double, double* %6, i64 %indvars.iv217
  store double 0.000000e+00, double* %109, align 8
  %sunkaddr129 = shl nsw i64 %indvars.iv217, 3
  %sunkaddr130 = add i64 %55, %sunkaddr129
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to double*
  store double %56, double* %sunkaddr131, align 8
  %110 = tail call double @sqrt(double %56) #4
  %111 = fcmp ugt double %110, 1.000000e-01
  %112 = select i1 %111, double %110, double 1.000000e+00
  store double %112, double* %sunkaddr131, align 8
  %indvars.iv.next218 = add nuw nsw i64 %indvars.iv217, 1
  %113 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next218
  store double 0.000000e+00, double* %113, align 8
  %sunkaddr129.1 = shl nsw i64 %indvars.iv.next218, 3
  %sunkaddr130.1 = add i64 %55, %sunkaddr129.1
  %sunkaddr131.1 = inttoptr i64 %sunkaddr130.1 to double*
  store double %56, double* %sunkaddr131.1, align 8
  %114 = tail call double @sqrt(double %56) #4
  %115 = fcmp ugt double %114, 1.000000e-01
  %116 = select i1 %115, double %114, double 1.000000e+00
  store double %116, double* %sunkaddr131.1, align 8
  %indvars.iv.next218.1 = add nsw i64 %indvars.iv217, 2
  %exitcond220.1 = icmp eq i64 %indvars.iv.next218.1, %wide.trip.count219
  br i1 %exitcond220.1, label %._crit_edge110.._crit_edge111_crit_edge.loopexit259.unr-lcssa, label %.lr.ph159.split

._crit_edge111.._crit_edge113_crit_edge.loopexit: ; preds = %._crit_edge112._crit_edge.us
  br label %._crit_edge111.._crit_edge113_crit_edge

._crit_edge111.._crit_edge113_crit_edge:          ; preds = %._crit_edge111.._crit_edge113_crit_edge.loopexit, %._crit_edge110.._crit_edge111_crit_edge
  %117 = add nsw i32 %0, -1
  %118 = icmp sgt i32 %0, 1
  br i1 %118, label %._crit_edge113.._crit_edge114_crit_edge.lr.ph, label %._crit_edge113._crit_edge

._crit_edge113.._crit_edge114_crit_edge.lr.ph:    ; preds = %._crit_edge111.._crit_edge113_crit_edge
  br i1 %94, label %._crit_edge113.._crit_edge114_crit_edge.us.preheader, label %._crit_edge113.._crit_edge114_crit_edge.preheader

._crit_edge113.._crit_edge114_crit_edge.us.preheader: ; preds = %._crit_edge113.._crit_edge114_crit_edge.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %119 = icmp eq i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %._crit_edge113.._crit_edge114_crit_edge.us

._crit_edge113.._crit_edge114_crit_edge.preheader: ; preds = %._crit_edge113.._crit_edge114_crit_edge.lr.ph
  %120 = zext i32 %117 to i64
  %121 = add i32 %0, -2
  %122 = zext i32 %121 to i64
  %wide.trip.count195.3 = zext i32 %0 to i64
  br label %._crit_edge113.._crit_edge114_crit_edge

._crit_edge113.._crit_edge114_crit_edge.us:       ; preds = %._crit_edge113.._crit_edge114_crit_edge.us.preheader, %._crit_edge113.us
  %.3141.us = phi i32 [ %125, %._crit_edge113.us ], [ 0, %._crit_edge113.._crit_edge114_crit_edge.us.preheader ]
  %123 = sext i32 %.3141.us to i64
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %123, i64 %123
  store double 1.000000e+00, double* %124, align 8
  %125 = add nsw i32 %.3141.us, 1
  %126 = icmp slt i32 %125, %0
  br i1 %126, label %.lr.ph.us.us.preheader, label %._crit_edge113.us

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge113.._crit_edge114_crit_edge.us
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %123
  br label %.lr.ph.us.us

._crit_edge113.us.loopexit:                       ; preds = %.._crit_edge114.loopexit_crit_edge.us.us
  br label %._crit_edge113.us

._crit_edge113.us:                                ; preds = %._crit_edge113.us.loopexit, %._crit_edge113.._crit_edge114_crit_edge.us
  %128 = icmp slt i32 %125, %117
  br i1 %128, label %._crit_edge113.._crit_edge114_crit_edge.us, label %._crit_edge113._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %.._crit_edge114.loopexit_crit_edge.us.us
  %129 = phi i32 [ %138, %.._crit_edge114.loopexit_crit_edge.us.us ], [ %125, %.lr.ph.us.us.preheader ]
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %123, i64 %130
  store double 0.000000e+00, double* %131, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %132 = load double, double* %127, align 8
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %130
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fadd double %135, 0.000000e+00
  store double %136, double* %131, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %136, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %.lcssa.unr.ph = phi double [ %136, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  br i1 %119, label %.._crit_edge114.loopexit_crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

.._crit_edge114.loopexit_crit_edge.us.us.loopexit: ; preds = %.lr.ph.us.us.new
  br label %.._crit_edge114.loopexit_crit_edge.us.us

.._crit_edge114.loopexit_crit_edge.us.us:         ; preds = %.._crit_edge114.loopexit_crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %152, %.._crit_edge114.loopexit_crit_edge.us.us.loopexit ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %130, i64 %123
  store double %.lcssa, double* %137, align 8
  %138 = add nsw i32 %129, 1
  %139 = icmp slt i32 %138, %0
  br i1 %139, label %.lr.ph.us.us, label %._crit_edge113.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %140 = phi double [ %152, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %123
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %130
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fadd double %140, %145
  store double %146, double* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %123
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %130
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fadd double %146, %151
  store double %152, double* %131, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.._crit_edge114.loopexit_crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge113.._crit_edge114_crit_edge:          ; preds = %._crit_edge113, %._crit_edge113.._crit_edge114_crit_edge.preheader
  %indvar = phi i64 [ 0, %._crit_edge113.._crit_edge114_crit_edge.preheader ], [ %indvar.next, %._crit_edge113 ]
  %indvars.iv191 = phi i64 [ 1, %._crit_edge113.._crit_edge114_crit_edge.preheader ], [ %indvars.iv.next192, %._crit_edge113 ]
  %.3141 = phi i32 [ 0, %._crit_edge113.._crit_edge114_crit_edge.preheader ], [ %157, %._crit_edge113 ]
  %153 = sub i64 %122, %indvar
  %154 = trunc i64 %153 to i32
  %155 = sext i32 %.3141 to i64
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %155
  store double 1.000000e+00, double* %156, align 8
  %157 = add nsw i32 %.3141, 1
  %158 = icmp slt i32 %157, %0
  br i1 %158, label %.lr.ph140.split.preheader, label %._crit_edge113

.lr.ph140.split.preheader:                        ; preds = %._crit_edge113.._crit_edge114_crit_edge
  %159 = sub i64 %120, %indvar
  %160 = trunc i64 %159 to i32
  %xtraiter198 = and i32 %160, 3
  %lcmp.mod199 = icmp eq i32 %xtraiter198, 0
  br i1 %lcmp.mod199, label %.lr.ph140.split.prol.loopexit, label %.lr.ph140.split.prol.preheader

.lr.ph140.split.prol.preheader:                   ; preds = %.lr.ph140.split.preheader
  br label %.lr.ph140.split.prol

.lr.ph140.split.prol:                             ; preds = %.lr.ph140.split.prol.preheader, %.lr.ph140.split.prol
  %indvars.iv193.prol = phi i64 [ %indvars.iv.next194.prol, %.lr.ph140.split.prol ], [ %indvars.iv191, %.lr.ph140.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph140.split.prol ], [ %xtraiter198, %.lr.ph140.split.prol.preheader ]
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %indvars.iv193.prol
  store double 0.000000e+00, double* %161, align 8
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv193.prol, i64 %155
  store double 0.000000e+00, double* %162, align 8
  %indvars.iv.next194.prol = add nuw nsw i64 %indvars.iv193.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph140.split.prol.loopexit.loopexit, label %.lr.ph140.split.prol, !llvm.loop !1

.lr.ph140.split.prol.loopexit.loopexit:           ; preds = %.lr.ph140.split.prol
  br label %.lr.ph140.split.prol.loopexit

.lr.ph140.split.prol.loopexit:                    ; preds = %.lr.ph140.split.prol.loopexit.loopexit, %.lr.ph140.split.preheader
  %indvars.iv193.unr = phi i64 [ %indvars.iv191, %.lr.ph140.split.preheader ], [ %indvars.iv.next194.prol, %.lr.ph140.split.prol.loopexit.loopexit ]
  %163 = icmp ult i32 %154, 3
  br i1 %163, label %._crit_edge113, label %.lr.ph140.split.preheader257

.lr.ph140.split.preheader257:                     ; preds = %.lr.ph140.split.prol.loopexit
  br label %.lr.ph140.split

.lr.ph140.split:                                  ; preds = %.lr.ph140.split.preheader257, %.lr.ph140.split
  %indvars.iv193 = phi i64 [ %indvars.iv.next194.3, %.lr.ph140.split ], [ %indvars.iv193.unr, %.lr.ph140.split.preheader257 ]
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %indvars.iv193
  store double 0.000000e+00, double* %164, align 8
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv193, i64 %155
  store double 0.000000e+00, double* %165, align 8
  %indvars.iv.next194 = add nuw nsw i64 %indvars.iv193, 1
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %indvars.iv.next194
  store double 0.000000e+00, double* %166, align 8
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next194, i64 %155
  store double 0.000000e+00, double* %167, align 8
  %indvars.iv.next194.1 = add nsw i64 %indvars.iv193, 2
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %indvars.iv.next194.1
  store double 0.000000e+00, double* %168, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next194.1, i64 %155
  store double 0.000000e+00, double* %169, align 8
  %indvars.iv.next194.2 = add nsw i64 %indvars.iv193, 3
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %155, i64 %indvars.iv.next194.2
  store double 0.000000e+00, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next194.2, i64 %155
  store double 0.000000e+00, double* %171, align 8
  %indvars.iv.next194.3 = add nsw i64 %indvars.iv193, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next194.3, %wide.trip.count195.3
  br i1 %exitcond.3, label %._crit_edge113.loopexit, label %.lr.ph140.split

._crit_edge113.loopexit:                          ; preds = %.lr.ph140.split
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph140.split.prol.loopexit, %._crit_edge113.._crit_edge114_crit_edge
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %120
  br i1 %exitcond, label %._crit_edge113._crit_edge.loopexit258, label %._crit_edge113.._crit_edge114_crit_edge

._crit_edge113._crit_edge.loopexit:               ; preds = %._crit_edge113.us
  br label %._crit_edge113._crit_edge

._crit_edge113._crit_edge.loopexit258:            ; preds = %._crit_edge113
  br label %._crit_edge113._crit_edge

._crit_edge113._crit_edge:                        ; preds = %._crit_edge113._crit_edge.loopexit258, %._crit_edge113._crit_edge.loopexit, %._crit_edge111.._crit_edge112_crit_edge.lr.ph, %._crit_edge111.._crit_edge113_crit_edge
  %172 = sext i32 %0 to i64
  %173 = add nsw i64 %172, -1
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %173, i64 %173
  store double 1.000000e+00, double* %174, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.._crit_edge12_crit_edge.us.preheader, label %._crit_edge15

.._crit_edge12_crit_edge.us.preheader:            ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge12_crit_edge.us

.._crit_edge12_crit_edge.us:                      ; preds = %.._crit_edge12_crit_edge.us.preheader, %._crit_edge12._crit_edge.us
  %.01114.us = phi i32 [ %22, %._crit_edge12._crit_edge.us ], [ 0, %.._crit_edge12_crit_edge.us.preheader ]
  %8 = mul nsw i32 %.01114.us, %0
  %9 = sext i32 %.01114.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge.us, %.._crit_edge12_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge12_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %16, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge12._crit_edge.us, label %11

._crit_edge12._crit_edge.us:                      ; preds = %._crit_edge.us
  %22 = add nsw i32 %.01114.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.._crit_edge12_crit_edge.us, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge12._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
