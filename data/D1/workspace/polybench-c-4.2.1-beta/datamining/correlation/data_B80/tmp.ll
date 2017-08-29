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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %18)
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
  %storemerge8 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %storemerge8 to double
  %4 = sext i32 %storemerge8 to i64
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
  %20 = add nsw i32 %storemerge8, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph135, label %._crit_edge.._crit_edge90_crit_edge

.lr.ph135:                                        ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph135.split.us.preheader, label %.lr.ph135.split.preheader

.lr.ph135.split.us.preheader:                     ; preds = %.lr.ph135
  %10 = and i32 %1, 1
  %wide.trip.count192.1 = zext i32 %1 to i64
  %11 = add nsw i64 %wide.trip.count192.1, -2
  %12 = icmp eq i32 %10, 0
  %13 = icmp eq i32 %1, 1
  %.pre = ptrtoint double* %5 to i64
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %14 = ptrtoint double* %5 to i64
  br label %.lr.ph135.split.us

.lr.ph135.split.preheader:                        ; preds = %.lr.ph135
  %15 = zext i32 %0 to i64
  %16 = add nsw i64 %15, -1
  %xtraiter214 = and i64 %15, 3
  %lcmp.mod215 = icmp eq i64 %xtraiter214, 0
  br i1 %lcmp.mod215, label %.lr.ph135.split.prol.loopexit, label %.lr.ph135.split.prol.preheader

.lr.ph135.split.prol.preheader:                   ; preds = %.lr.ph135.split.preheader
  %17 = fdiv double 0.000000e+00, %2
  br label %.lr.ph135.split.prol

.lr.ph135.split.prol:                             ; preds = %.lr.ph135.split.prol.preheader, %.lr.ph135.split.prol
  %indvars.iv194.prol = phi i64 [ %indvars.iv.next195.prol, %.lr.ph135.split.prol ], [ 0, %.lr.ph135.split.prol.preheader ]
  %prol.iter216 = phi i64 [ %prol.iter216.sub, %.lr.ph135.split.prol ], [ %xtraiter214, %.lr.ph135.split.prol.preheader ]
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv194.prol
  store double %17, double* %18, align 8
  %indvars.iv.next195.prol = add nuw nsw i64 %indvars.iv194.prol, 1
  %prol.iter216.sub = add i64 %prol.iter216, -1
  %prol.iter216.cmp = icmp eq i64 %prol.iter216.sub, 0
  br i1 %prol.iter216.cmp, label %.lr.ph135.split.prol.loopexit.loopexit, label %.lr.ph135.split.prol, !llvm.loop !1

.lr.ph135.split.prol.loopexit.loopexit:           ; preds = %.lr.ph135.split.prol
  br label %.lr.ph135.split.prol.loopexit

.lr.ph135.split.prol.loopexit:                    ; preds = %.lr.ph135.split.prol.loopexit.loopexit, %.lr.ph135.split.preheader
  %indvars.iv194.unr = phi i64 [ 0, %.lr.ph135.split.preheader ], [ %indvars.iv.next195.prol, %.lr.ph135.split.prol.loopexit.loopexit ]
  %19 = icmp ult i64 %16, 3
  br i1 %19, label %.lr.ph129, label %.lr.ph135.split.preheader221

.lr.ph135.split.preheader221:                     ; preds = %.lr.ph135.split.prol.loopexit
  %20 = insertelement <2 x double> undef, double %2, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fdiv <2 x double> zeroinitializer, %21
  %23 = add nsw i64 %15, -4
  %24 = sub i64 %23, %indvars.iv194.unr
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %xtraiter286 = and i64 %26, 3
  %lcmp.mod287 = icmp eq i64 %xtraiter286, 0
  br i1 %lcmp.mod287, label %.lr.ph135.split.prol.loopexit285, label %.lr.ph135.split.prol.preheader284

.lr.ph135.split.prol.preheader284:                ; preds = %.lr.ph135.split.preheader221
  br label %.lr.ph135.split.prol288

.lr.ph135.split.prol288:                          ; preds = %.lr.ph135.split.prol288, %.lr.ph135.split.prol.preheader284
  %indvars.iv194.prol289 = phi i64 [ %indvars.iv.next195.3.prol, %.lr.ph135.split.prol288 ], [ %indvars.iv194.unr, %.lr.ph135.split.prol.preheader284 ]
  %prol.iter290 = phi i64 [ %prol.iter290.sub, %.lr.ph135.split.prol288 ], [ %xtraiter286, %.lr.ph135.split.prol.preheader284 ]
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv194.prol289
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %22, <2 x double>* %28, align 8
  %indvars.iv.next195.1.prol = add nsw i64 %indvars.iv194.prol289, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1.prol
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %22, <2 x double>* %30, align 8
  %indvars.iv.next195.3.prol = add nsw i64 %indvars.iv194.prol289, 4
  %prol.iter290.sub = add i64 %prol.iter290, -1
  %prol.iter290.cmp = icmp eq i64 %prol.iter290.sub, 0
  br i1 %prol.iter290.cmp, label %.lr.ph135.split.prol.loopexit285.loopexit, label %.lr.ph135.split.prol288, !llvm.loop !3

.lr.ph135.split.prol.loopexit285.loopexit:        ; preds = %.lr.ph135.split.prol288
  br label %.lr.ph135.split.prol.loopexit285

.lr.ph135.split.prol.loopexit285:                 ; preds = %.lr.ph135.split.prol.loopexit285.loopexit, %.lr.ph135.split.preheader221
  %indvars.iv194.unr291 = phi i64 [ %indvars.iv194.unr, %.lr.ph135.split.preheader221 ], [ %indvars.iv.next195.3.prol, %.lr.ph135.split.prol.loopexit285.loopexit ]
  %31 = icmp ult i64 %24, 12
  br i1 %31, label %.lr.ph129, label %.lr.ph135.split.preheader221.new

.lr.ph135.split.preheader221.new:                 ; preds = %.lr.ph135.split.prol.loopexit285
  br label %.lr.ph135.split

.lr.ph135.split.us:                               ; preds = %.lr.ph135.split.us.preheader, %._crit_edge.us
  %storemerge133.us = phi i32 [ %61, %._crit_edge.us ], [ 0, %.lr.ph135.split.us.preheader ]
  %32 = sext i32 %storemerge133.us to i64
  %33 = getelementptr inbounds double, double* %5, i64 %32
  store double 0.000000e+00, double* %33, align 8
  br i1 %12, label %.prol.loopexit210, label %.prol.preheader209

.prol.preheader209:                               ; preds = %.lr.ph135.split.us
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %32
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, 0.000000e+00
  %sunkaddr142.prol = shl nsw i64 %32, 3
  %sunkaddr143.prol = add i64 %14, %sunkaddr142.prol
  %sunkaddr144.prol = inttoptr i64 %sunkaddr143.prol to double*
  store double %36, double* %sunkaddr144.prol, align 8
  br label %.prol.loopexit210

.prol.loopexit210:                                ; preds = %.prol.preheader209, %.lr.ph135.split.us
  %.lcssa199.unr.ph = phi double [ %36, %.prol.preheader209 ], [ undef, %.lr.ph135.split.us ]
  %indvars.iv190.unr.ph = phi i64 [ 1, %.prol.preheader209 ], [ 0, %.lr.ph135.split.us ]
  %.unr213.ph = phi double [ %36, %.prol.preheader209 ], [ 0.000000e+00, %.lr.ph135.split.us ]
  br i1 %13, label %.prol.loopexit210.._crit_edge.us_crit_edge, label %.lr.ph135.split.us.new.preheader

.lr.ph135.split.us.new.preheader:                 ; preds = %.prol.loopexit210
  %37 = sub nsw i64 %11, %indvars.iv190.unr.ph
  %38 = lshr i64 %37, 1
  %39 = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %39, 0
  br i1 %lcmp.mod, label %.lr.ph135.split.us.new.prol, label %.lr.ph135.split.us.new.prol.loopexit

.lr.ph135.split.us.new.prol:                      ; preds = %.lr.ph135.split.us.new.preheader
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv190.unr.ph, i64 %32
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %.unr213.ph
  %sunkaddr233.prol = shl nsw i64 %32, 3
  %sunkaddr234.prol = add i64 %sunkaddr.prol, %sunkaddr233.prol
  %sunkaddr235.prol = inttoptr i64 %sunkaddr234.prol to double*
  store double %42, double* %sunkaddr235.prol, align 8
  %indvars.iv.next191.prol = add nuw nsw i64 %indvars.iv190.unr.ph, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191.prol, i64 %32
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %sunkaddr235.prol, align 8
  %indvars.iv.next191.1.prol = or i64 %indvars.iv190.unr.ph, 2
  br label %.lr.ph135.split.us.new.prol.loopexit

.lr.ph135.split.us.new.prol.loopexit:             ; preds = %.lr.ph135.split.us.new.prol, %.lr.ph135.split.us.new.preheader
  %sunkaddr235.lcssa.unr.ph = phi double* [ %sunkaddr235.prol, %.lr.ph135.split.us.new.prol ], [ undef, %.lr.ph135.split.us.new.preheader ]
  %.lcssa280.unr.ph = phi double [ %45, %.lr.ph135.split.us.new.prol ], [ undef, %.lr.ph135.split.us.new.preheader ]
  %indvars.iv190.unr.ph281 = phi i64 [ %indvars.iv.next191.1.prol, %.lr.ph135.split.us.new.prol ], [ %indvars.iv190.unr.ph, %.lr.ph135.split.us.new.preheader ]
  %.unr.ph282 = phi double [ %45, %.lr.ph135.split.us.new.prol ], [ %.unr213.ph, %.lr.ph135.split.us.new.preheader ]
  %46 = icmp eq i64 %38, 0
  br i1 %46, label %._crit_edge.us, label %.lr.ph135.split.us.new.preheader.new

.lr.ph135.split.us.new.preheader.new:             ; preds = %.lr.ph135.split.us.new.prol.loopexit
  %sunkaddr233 = shl nsw i64 %32, 3
  %sunkaddr234 = add i64 %sunkaddr, %sunkaddr233
  %sunkaddr235 = inttoptr i64 %sunkaddr234 to double*
  %sunkaddr233.1 = shl nsw i64 %32, 3
  %sunkaddr234.1 = add i64 %sunkaddr.1, %sunkaddr233.1
  %sunkaddr235.1 = inttoptr i64 %sunkaddr234.1 to double*
  br label %.lr.ph135.split.us.new

.prol.loopexit210.._crit_edge.us_crit_edge:       ; preds = %.prol.loopexit210
  %.pre266 = shl nsw i64 %32, 3
  %.pre267 = add i64 %.pre, %.pre266
  %.pre268 = inttoptr i64 %.pre267 to double*
  br label %._crit_edge.us

.lr.ph135.split.us.new:                           ; preds = %.lr.ph135.split.us.new, %.lr.ph135.split.us.new.preheader.new
  %indvars.iv190 = phi i64 [ %indvars.iv190.unr.ph281, %.lr.ph135.split.us.new.preheader.new ], [ %indvars.iv.next191.1.1, %.lr.ph135.split.us.new ]
  %47 = phi double [ %.unr.ph282, %.lr.ph135.split.us.new.preheader.new ], [ %59, %.lr.ph135.split.us.new ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv190, i64 %32
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %sunkaddr235, align 8
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191, i64 %32
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %sunkaddr235, align 8
  %indvars.iv.next191.1 = add nsw i64 %indvars.iv190, 2
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191.1, i64 %32
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %sunkaddr235.1, align 8
  %indvars.iv.next191.1283 = add nsw i64 %indvars.iv190, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next191.1283, i64 %32
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %sunkaddr235.1, align 8
  %indvars.iv.next191.1.1 = add nsw i64 %indvars.iv190, 4
  %exitcond193.1.1 = icmp eq i64 %indvars.iv.next191.1.1, %wide.trip.count192.1
  br i1 %exitcond193.1.1, label %._crit_edge.us.loopexit, label %.lr.ph135.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph135.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph135.split.us.new.prol.loopexit, %.prol.loopexit210.._crit_edge.us_crit_edge
  %sunkaddr148.pre-phi = phi double* [ %.pre268, %.prol.loopexit210.._crit_edge.us_crit_edge ], [ %sunkaddr235.lcssa.unr.ph, %.lr.ph135.split.us.new.prol.loopexit ], [ %sunkaddr235.1, %._crit_edge.us.loopexit ]
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.prol.loopexit210.._crit_edge.us_crit_edge ], [ %.lcssa280.unr.ph, %.lr.ph135.split.us.new.prol.loopexit ], [ %59, %._crit_edge.us.loopexit ]
  %60 = fdiv double %.lcssa199, %2
  store double %60, double* %sunkaddr148.pre-phi, align 8
  %61 = add nsw i32 %storemerge133.us, 1
  %62 = icmp slt i32 %61, %0
  br i1 %62, label %.lr.ph135.split.us, label %.lr.ph129.loopexit

.lr.ph129.loopexit:                               ; preds = %._crit_edge.us
  br label %.lr.ph129

.lr.ph129.loopexit294:                            ; preds = %.lr.ph135.split
  br label %.lr.ph129

.lr.ph129:                                        ; preds = %.lr.ph129.loopexit294, %.lr.ph129.loopexit, %.lr.ph135.split.prol.loopexit, %.lr.ph135.split.prol.loopexit285
  %63 = icmp sgt i32 %1, 0
  br i1 %63, label %.lr.ph129.split.us.preheader, label %.lr.ph129.split.preheader

.lr.ph129.split.us.preheader:                     ; preds = %.lr.ph129
  %64 = and i32 %1, 1
  %wide.trip.count184.1 = zext i32 %1 to i64
  %65 = icmp eq i32 %64, 0
  %66 = icmp eq i32 %1, 1
  %.pre269 = ptrtoint double* %6 to i64
  %sunkaddr240 = ptrtoint double* %5 to i64
  %sunkaddr244 = ptrtoint double* %6 to i64
  %67 = ptrtoint double* %6 to i64
  %68 = ptrtoint double* %5 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.preheader:                        ; preds = %.lr.ph129
  %69 = and i32 %0, 1
  %lcmp.mod208 = icmp eq i32 %69, 0
  br i1 %lcmp.mod208, label %.lr.ph129.split.prol.loopexit, label %.lr.ph129.split.prol

.lr.ph129.split.prol:                             ; preds = %.lr.ph129.split.preheader
  %70 = fdiv double 0.000000e+00, %2
  store double %70, double* %6, align 8
  %71 = tail call double @sqrt(double %70) #4
  %72 = fcmp ugt double %71, 1.000000e-01
  %73 = select i1 %72, double %71, double 1.000000e+00
  store double %73, double* %6, align 8
  br label %.lr.ph129.split.prol.loopexit

.lr.ph129.split.prol.loopexit:                    ; preds = %.lr.ph129.split.preheader, %.lr.ph129.split.prol
  %indvars.iv186.unr = phi i64 [ 0, %.lr.ph129.split.preheader ], [ 1, %.lr.ph129.split.prol ]
  %74 = icmp eq i32 %0, 1
  br i1 %74, label %._crit_edge.._crit_edge90_crit_edge, label %.lr.ph129.split.preheader219

.lr.ph129.split.preheader219:                     ; preds = %.lr.ph129.split.prol.loopexit
  %75 = insertelement <2 x double> undef, double %2, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  %77 = fdiv <2 x double> zeroinitializer, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %wide.trip.count188.1 = zext i32 %0 to i64
  br label %.lr.ph129.split

.lr.ph129.split.us:                               ; preds = %.lr.ph129.split.us.preheader, %._crit_edge126.us
  %storemerge1128.us = phi i32 [ %105, %._crit_edge126.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %80 = sext i32 %storemerge1128.us to i64
  %81 = getelementptr inbounds double, double* %6, i64 %80
  store double 0.000000e+00, double* %81, align 8
  br i1 %65, label %.prol.loopexit203, label %.prol.preheader202

.prol.preheader202:                               ; preds = %.lr.ph129.split.us
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %80
  %83 = load double, double* %82, align 8
  %sunkaddr150.prol = shl nsw i64 %80, 3
  %sunkaddr151.prol = add i64 %68, %sunkaddr150.prol
  %sunkaddr152.prol = inttoptr i64 %sunkaddr151.prol to double*
  %84 = load double, double* %sunkaddr152.prol, align 8
  %85 = fsub double %83, %84
  %86 = fmul double %85, %85
  %87 = fadd double %86, 0.000000e+00
  %sunkaddr155.prol = add i64 %67, %sunkaddr150.prol
  %sunkaddr156.prol = inttoptr i64 %sunkaddr155.prol to double*
  store double %87, double* %sunkaddr156.prol, align 8
  br label %.prol.loopexit203

.prol.loopexit203:                                ; preds = %.prol.preheader202, %.lr.ph129.split.us
  %.lcssa198.unr.ph = phi double [ %87, %.prol.preheader202 ], [ undef, %.lr.ph129.split.us ]
  %indvars.iv182.unr.ph = phi i64 [ 1, %.prol.preheader202 ], [ 0, %.lr.ph129.split.us ]
  %.unr206.ph = phi double [ %87, %.prol.preheader202 ], [ 0.000000e+00, %.lr.ph129.split.us ]
  br i1 %66, label %.prol.loopexit203.._crit_edge126.us_crit_edge, label %.lr.ph129.split.us.new.preheader

.lr.ph129.split.us.new.preheader:                 ; preds = %.prol.loopexit203
  %sunkaddr241 = shl nsw i64 %80, 3
  %sunkaddr242 = add i64 %sunkaddr240, %sunkaddr241
  %sunkaddr243 = inttoptr i64 %sunkaddr242 to double*
  %sunkaddr246 = add i64 %sunkaddr244, %sunkaddr241
  %sunkaddr247 = inttoptr i64 %sunkaddr246 to double*
  br label %.lr.ph129.split.us.new

.prol.loopexit203.._crit_edge126.us_crit_edge:    ; preds = %.prol.loopexit203
  %.pre271 = shl nsw i64 %80, 3
  %.pre272 = add i64 %.pre269, %.pre271
  %.pre273 = inttoptr i64 %.pre272 to double*
  br label %._crit_edge126.us

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new.preheader, %.lr.ph129.split.us.new
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.1, %.lr.ph129.split.us.new ], [ %indvars.iv182.unr.ph, %.lr.ph129.split.us.new.preheader ]
  %88 = phi double [ %100, %.lr.ph129.split.us.new ], [ %.unr206.ph, %.lr.ph129.split.us.new.preheader ]
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv182, i64 %80
  %90 = load double, double* %89, align 8
  %91 = load double, double* %sunkaddr243, align 8
  %92 = fsub double %90, %91
  %93 = fmul double %92, %92
  %94 = fadd double %88, %93
  store double %94, double* %sunkaddr247, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next183, i64 %80
  %96 = load double, double* %95, align 8
  %97 = load double, double* %sunkaddr243, align 8
  %98 = fsub double %96, %97
  %99 = fmul double %98, %98
  %100 = fadd double %94, %99
  store double %100, double* %sunkaddr247, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next183.1, %wide.trip.count184.1
  br i1 %exitcond185.1, label %._crit_edge126.us.loopexit, label %.lr.ph129.split.us.new

._crit_edge126.us.loopexit:                       ; preds = %.lr.ph129.split.us.new
  br label %._crit_edge126.us

._crit_edge126.us:                                ; preds = %._crit_edge126.us.loopexit, %.prol.loopexit203.._crit_edge126.us_crit_edge
  %sunkaddr160.pre-phi = phi double* [ %.pre273, %.prol.loopexit203.._crit_edge126.us_crit_edge ], [ %sunkaddr247, %._crit_edge126.us.loopexit ]
  %.lcssa198 = phi double [ %.lcssa198.unr.ph, %.prol.loopexit203.._crit_edge126.us_crit_edge ], [ %100, %._crit_edge126.us.loopexit ]
  %101 = fdiv double %.lcssa198, %2
  store double %101, double* %sunkaddr160.pre-phi, align 8
  %102 = tail call double @sqrt(double %101) #4
  %103 = fcmp ugt double %102, 1.000000e-01
  %104 = select i1 %103, double %102, double 1.000000e+00
  store double %104, double* %sunkaddr160.pre-phi, align 8
  %105 = add nsw i32 %storemerge1128.us, 1
  %106 = icmp slt i32 %105, %0
  br i1 %106, label %.lr.ph129.split.us, label %._crit_edge.._crit_edge90_crit_edge.loopexit

.lr.ph135.split:                                  ; preds = %.lr.ph135.split, %.lr.ph135.split.preheader221.new
  %indvars.iv194 = phi i64 [ %indvars.iv194.unr291, %.lr.ph135.split.preheader221.new ], [ %indvars.iv.next195.3.3, %.lr.ph135.split ]
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv194
  %108 = bitcast double* %107 to <2 x double>*
  store <2 x double> %22, <2 x double>* %108, align 8
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %109 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1
  %110 = bitcast double* %109 to <2 x double>*
  store <2 x double> %22, <2 x double>* %110, align 8
  %indvars.iv.next195.3 = add nsw i64 %indvars.iv194, 4
  %111 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.3
  %112 = bitcast double* %111 to <2 x double>*
  store <2 x double> %22, <2 x double>* %112, align 8
  %indvars.iv.next195.1.1 = add nsw i64 %indvars.iv194, 6
  %113 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1.1
  %114 = bitcast double* %113 to <2 x double>*
  store <2 x double> %22, <2 x double>* %114, align 8
  %indvars.iv.next195.3.1 = add nsw i64 %indvars.iv194, 8
  %115 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.3.1
  %116 = bitcast double* %115 to <2 x double>*
  store <2 x double> %22, <2 x double>* %116, align 8
  %indvars.iv.next195.1.2 = add nsw i64 %indvars.iv194, 10
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1.2
  %118 = bitcast double* %117 to <2 x double>*
  store <2 x double> %22, <2 x double>* %118, align 8
  %indvars.iv.next195.3.2 = add nsw i64 %indvars.iv194, 12
  %119 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.3.2
  %120 = bitcast double* %119 to <2 x double>*
  store <2 x double> %22, <2 x double>* %120, align 8
  %indvars.iv.next195.1.3 = add nsw i64 %indvars.iv194, 14
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next195.1.3
  %122 = bitcast double* %121 to <2 x double>*
  store <2 x double> %22, <2 x double>* %122, align 8
  %indvars.iv.next195.3.3 = add nsw i64 %indvars.iv194, 16
  %exitcond197.3.3 = icmp eq i64 %indvars.iv.next195.3.3, %15
  br i1 %exitcond197.3.3, label %.lr.ph129.loopexit294, label %.lr.ph135.split

._crit_edge.._crit_edge90_crit_edge.loopexit:     ; preds = %._crit_edge126.us
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge.loopexit293:  ; preds = %.lr.ph129.split
  br label %._crit_edge.._crit_edge90_crit_edge

._crit_edge.._crit_edge90_crit_edge:              ; preds = %._crit_edge.._crit_edge90_crit_edge.loopexit293, %._crit_edge.._crit_edge90_crit_edge.loopexit, %7, %.lr.ph129.split.prol.loopexit
  %123 = icmp sgt i32 %1, 0
  br i1 %123, label %._crit_edge90.._crit_edge92_crit_edge.lr.ph, label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge92_crit_edge.lr.ph:      ; preds = %._crit_edge.._crit_edge90_crit_edge
  %124 = icmp sgt i32 %0, 0
  br i1 %124, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %._crit_edge90.._crit_edge93_crit_edge.thread

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %wide.trip.count179 = zext i32 %0 to i64
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge93_crit_edge.thread:     ; preds = %._crit_edge90.._crit_edge92_crit_edge.lr.ph
  %125 = add nsw i32 %0, -1
  br label %._crit_edge93._crit_edge

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge90.._crit_edge92_crit_edge.us.preheader, %._crit_edge92._crit_edge.us
  %storemerge2122.us = phi i32 [ %138, %._crit_edge92._crit_edge.us ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  %126 = sext i32 %storemerge2122.us to i64
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv177 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next178, %._crit_edge92.us ]
  %127 = getelementptr inbounds double, double* %5, i64 %indvars.iv177
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %126, i64 %indvars.iv177
  %130 = load double, double* %129, align 8
  %131 = fsub double %130, %128
  store double %131, double* %129, align 8
  %132 = tail call double @sqrt(double %2) #4
  %133 = getelementptr inbounds double, double* %6, i64 %indvars.iv177
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = load double, double* %129, align 8
  %137 = fdiv double %136, %135
  store double %137, double* %129, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, %wide.trip.count179
  br i1 %exitcond180, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %138 = add nsw i32 %storemerge2122.us, 1
  %139 = icmp slt i32 %138, %1
  br i1 %139, label %._crit_edge90.._crit_edge92_crit_edge.us, label %._crit_edge90.._crit_edge93_crit_edge.loopexit

.lr.ph129.split:                                  ; preds = %.lr.ph129.split.preheader219, %.lr.ph129.split
  %indvars.iv186 = phi i64 [ %indvars.iv.next187.1, %.lr.ph129.split ], [ %indvars.iv186.unr, %.lr.ph129.split.preheader219 ]
  %140 = getelementptr inbounds double, double* %6, i64 %indvars.iv186
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %141 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next187
  %142 = bitcast double* %140 to <2 x double>*
  store <2 x double> %77, <2 x double>* %142, align 8
  %143 = tail call double @sqrt(double %78) #4
  %144 = fcmp ugt double %143, 1.000000e-01
  %145 = select i1 %144, double %143, double 1.000000e+00
  store double %145, double* %140, align 8
  %146 = tail call double @sqrt(double %79) #4
  %147 = fcmp ugt double %146, 1.000000e-01
  %148 = select i1 %147, double %146, double 1.000000e+00
  store double %148, double* %141, align 8
  %indvars.iv.next187.1 = add nsw i64 %indvars.iv186, 2
  %exitcond189.1 = icmp eq i64 %indvars.iv.next187.1, %wide.trip.count188.1
  br i1 %exitcond189.1, label %._crit_edge.._crit_edge90_crit_edge.loopexit293, label %.lr.ph129.split

._crit_edge90.._crit_edge93_crit_edge.loopexit:   ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge93_crit_edge

._crit_edge90.._crit_edge93_crit_edge:            ; preds = %._crit_edge90.._crit_edge93_crit_edge.loopexit, %._crit_edge.._crit_edge90_crit_edge
  %149 = add nsw i32 %0, -1
  %150 = icmp sgt i32 %0, 1
  br i1 %150, label %.lr.ph110, label %._crit_edge93._crit_edge

.lr.ph110:                                        ; preds = %._crit_edge90.._crit_edge93_crit_edge
  %151 = icmp sgt i32 %1, 0
  br i1 %151, label %.lr.ph110.split.us.preheader, label %.lr.ph110.split.preheader

.lr.ph110.split.us.preheader:                     ; preds = %.lr.ph110
  %152 = and i32 %1, 1
  %wide.trip.count.1 = zext i32 %1 to i64
  %153 = icmp eq i32 %152, 0
  %154 = icmp eq i32 %1, 1
  %sunkaddr256 = ptrtoint [1200 x double]* %3 to i64
  br label %.lr.ph110.split.us

.lr.ph110.split.preheader:                        ; preds = %.lr.ph110
  %155 = zext i32 %0 to i64
  %156 = add nuw nsw i64 %155, 3
  %157 = add nsw i64 %155, -2
  br label %.lr.ph110.split

.lr.ph110.split.us:                               ; preds = %.lr.ph110.split.us.preheader, %._crit_edge93.us
  %storemerge3109.us = phi i32 [ %storemerge4104.us, %._crit_edge93.us ], [ 0, %.lr.ph110.split.us.preheader ]
  %158 = sext i32 %storemerge3109.us to i64
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %158, i64 %158
  store double 1.000000e+00, double* %159, align 8
  %storemerge4104.us = add nsw i32 %storemerge3109.us, 1
  %160 = icmp slt i32 %storemerge4104.us, %0
  br i1 %160, label %.lr.ph.us.us.preheader, label %._crit_edge93.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph110.split.us
  %sunkaddr257 = shl nsw i64 %158, 3
  %sunkaddr258 = add i64 %sunkaddr256, %sunkaddr257
  %sunkaddr259 = inttoptr i64 %sunkaddr258 to double*
  br label %.lr.ph.us.us

._crit_edge93.us.loopexit:                        ; preds = %._crit_edge102.us.us
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us.loopexit, %.lr.ph110.split.us
  %161 = icmp slt i32 %storemerge4104.us, %149
  br i1 %161, label %.lr.ph110.split.us, label %._crit_edge93._crit_edge.loopexit

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge102.us.us
  %storemerge4105.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge102.us.us ], [ %storemerge4104.us, %.lr.ph.us.us.preheader ]
  %162 = sext i32 %storemerge4105.us.us to i64
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %158, i64 %162
  store double 0.000000e+00, double* %163, align 8
  br i1 %153, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %164 = load double, double* %sunkaddr259, align 8
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %162
  %166 = load double, double* %165, align 8
  %167 = fmul double %164, %166
  %168 = fadd double %167, 0.000000e+00
  store double %168, double* %163, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %.lcssa.unr.ph = phi double [ %168, %.prol.preheader ], [ undef, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %168, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %154, label %._crit_edge102.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge102.us.us.loopexit:                    ; preds = %.lr.ph.us.us.new
  br label %._crit_edge102.us.us

._crit_edge102.us.us:                             ; preds = %._crit_edge102.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %183, %._crit_edge102.us.us.loopexit ]
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %162, i64 %158
  store double %.lcssa, double* %169, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4105.us.us, 1
  %170 = icmp slt i32 %storemerge4.us.us, %0
  br i1 %170, label %.lr.ph.us.us, label %._crit_edge93.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %171 = phi double [ %183, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %158
  %173 = load double, double* %172, align 8
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %162
  %175 = load double, double* %174, align 8
  %176 = fmul double %173, %175
  %177 = fadd double %171, %176
  store double %177, double* %163, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %158
  %179 = load double, double* %178, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %162
  %181 = load double, double* %180, align 8
  %182 = fmul double %179, %181
  %183 = fadd double %177, %182
  store double %183, double* %163, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge102.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph110.split:                                  ; preds = %._crit_edge93, %.lr.ph110.split.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge93 ], [ 0, %.lr.ph110.split.preheader ]
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge93 ], [ 1, %.lr.ph110.split.preheader ]
  %storemerge3109 = phi i32 [ %storemerge4104, %._crit_edge93 ], [ 0, %.lr.ph110.split.preheader ]
  %184 = sub i64 %157, %indvar
  %185 = sext i32 %storemerge3109 to i64
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %185
  store double 1.000000e+00, double* %186, align 8
  %storemerge4104 = add nsw i32 %storemerge3109, 1
  %187 = icmp slt i32 %storemerge4104, %0
  br i1 %187, label %.lr.ph107.split.preheader, label %._crit_edge93

.lr.ph107.split.preheader:                        ; preds = %.lr.ph110.split
  %188 = sub i64 %156, %indvar
  %xtraiter200 = and i64 %188, 3
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %.lr.ph107.split.prol.loopexit, label %.lr.ph107.split.prol.preheader

.lr.ph107.split.prol.preheader:                   ; preds = %.lr.ph107.split.preheader
  br label %.lr.ph107.split.prol

.lr.ph107.split.prol:                             ; preds = %.lr.ph107.split.prol.preheader, %.lr.ph107.split.prol
  %indvars.iv169.prol = phi i64 [ %indvars.iv.next170.prol, %.lr.ph107.split.prol ], [ %indvars.iv167, %.lr.ph107.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph107.split.prol ], [ %xtraiter200, %.lr.ph107.split.prol.preheader ]
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %indvars.iv169.prol
  store double 0.000000e+00, double* %189, align 8
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169.prol, i64 %185
  %191 = bitcast double* %190 to i64*
  store i64 0, i64* %191, align 8
  %indvars.iv.next170.prol = add nuw nsw i64 %indvars.iv169.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph107.split.prol.loopexit.loopexit, label %.lr.ph107.split.prol, !llvm.loop !4

.lr.ph107.split.prol.loopexit.loopexit:           ; preds = %.lr.ph107.split.prol
  br label %.lr.ph107.split.prol.loopexit

.lr.ph107.split.prol.loopexit:                    ; preds = %.lr.ph107.split.prol.loopexit.loopexit, %.lr.ph107.split.preheader
  %indvars.iv169.unr = phi i64 [ %indvars.iv167, %.lr.ph107.split.preheader ], [ %indvars.iv.next170.prol, %.lr.ph107.split.prol.loopexit.loopexit ]
  %192 = icmp ult i64 %184, 3
  br i1 %192, label %._crit_edge93, label %.lr.ph107.split.preheader274

.lr.ph107.split.preheader274:                     ; preds = %.lr.ph107.split.prol.loopexit
  br label %.lr.ph107.split

.lr.ph107.split:                                  ; preds = %.lr.ph107.split.preheader274, %.lr.ph107.split
  %indvars.iv169 = phi i64 [ %indvars.iv.next170.3, %.lr.ph107.split ], [ %indvars.iv169.unr, %.lr.ph107.split.preheader274 ]
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %indvars.iv169
  store double 0.000000e+00, double* %193, align 8
  %194 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv169, i64 %185
  %195 = bitcast double* %194 to i64*
  store i64 0, i64* %195, align 8
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %indvars.iv.next170
  store double 0.000000e+00, double* %196, align 8
  %197 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170, i64 %185
  %198 = bitcast double* %197 to i64*
  store i64 0, i64* %198, align 8
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %indvars.iv.next170.1
  store double 0.000000e+00, double* %199, align 8
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170.1, i64 %185
  %201 = bitcast double* %200 to i64*
  store i64 0, i64* %201, align 8
  %indvars.iv.next170.2 = add nsw i64 %indvars.iv169, 3
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %185, i64 %indvars.iv.next170.2
  store double 0.000000e+00, double* %202, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next170.2, i64 %185
  %204 = bitcast double* %203 to i64*
  store i64 0, i64* %204, align 8
  %indvars.iv.next170.3 = add nsw i64 %indvars.iv169, 4
  %exitcond172.3 = icmp eq i64 %indvars.iv.next170.3, %155
  br i1 %exitcond172.3, label %._crit_edge93.loopexit, label %.lr.ph107.split

._crit_edge93.loopexit:                           ; preds = %.lr.ph107.split
  br label %._crit_edge93

._crit_edge93:                                    ; preds = %._crit_edge93.loopexit, %.lr.ph107.split.prol.loopexit, %.lr.ph110.split
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond176 = icmp eq i64 %indvars.iv.next168, %155
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond176, label %._crit_edge93._crit_edge.loopexit292, label %.lr.ph110.split

._crit_edge93._crit_edge.loopexit:                ; preds = %._crit_edge93.us
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge.loopexit292:             ; preds = %._crit_edge93
  br label %._crit_edge93._crit_edge

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93._crit_edge.loopexit292, %._crit_edge93._crit_edge.loopexit, %._crit_edge90.._crit_edge93_crit_edge.thread, %._crit_edge90.._crit_edge93_crit_edge
  %205 = phi i32 [ %125, %._crit_edge90.._crit_edge93_crit_edge.thread ], [ %149, %._crit_edge90.._crit_edge93_crit_edge ], [ %149, %._crit_edge93._crit_edge.loopexit ], [ %149, %._crit_edge93._crit_edge.loopexit292 ]
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %206, i64 %206
  store double 1.000000e+00, double* %207, align 8
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
  br i1 %7, label %.._crit_edge_crit_edge.us.preheader, label %._crit_edge

.._crit_edge_crit_edge.us.preheader:              ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %.._crit_edge_crit_edge.us.preheader, %._crit_edge._crit_edge.us
  %storemerge12.us = phi i32 [ %22, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %8 = mul nsw i32 %storemerge12.us, %0
  %9 = sext i32 %storemerge12.us to i64
  %10 = zext i32 %8 to i64
  br label %11

; <label>:11:                                     ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge10.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %9, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %11

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %22 = add nsw i32 %storemerge12.us, 1
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %.._crit_edge_crit_edge.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
