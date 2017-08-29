; ModuleID = 'bitcnts.ll'
source_filename = "bitcnts.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@main1.pBitCntFunc = internal unnamed_addr constant [7 x i32 (i64)*] [i32 (i64)* @bit_count, i32 (i64)* @bitcount, i32 (i64)* @ntbl_bitcnt, i32 (i64)* @ntbl_bitcount, i32 (i64)* @BW_btbl_bitcount, i32 (i64)* @AR_btbl_bitcount, i32 (i64)* @bit_shifter], align 16
@main1.text = internal unnamed_addr constant [7 x i8*] [i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"%-38s> Bits: %ld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main1(i32, i8** nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = icmp slt i32 %0, 2
  br i1 %4, label %5, label %8

; <label>:5:                                      ; preds = %3
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %6) #7
  tail call void @exit(i32 1) #8
  unreachable

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds i8*, i8** %1, i64 1
  %10 = load i8*, i8** %9, align 8
  %11 = tail call i32 @atoi(i8* %10) #9
  %12 = icmp eq i32 %2, 0
  br i1 %12, label %.preheader4, label %13

; <label>:13:                                     ; preds = %8
  %14 = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.8, i64 0, i64 0))
  br label %.preheader4

.preheader4:                                      ; preds = %8, %13
  %15 = sext i32 %11 to i64
  %16 = icmp sgt i32 %11, 0
  br i1 %16, label %.preheader.us.preheader, label %.preheader4.split

.preheader.us.preheader:                          ; preds = %.preheader4
  br label %.preheader.us

; <label>:17:                                     ; preds = %._crit_edge.us
  %18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i64 %21)
  br label %.preheader.us.124.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %.07.us = phi i64 [ %23, %.preheader.us ], [ 1, %.preheader.us.preheader ]
  %.016.us = phi i64 [ %21, %.preheader.us ], [ 0, %.preheader.us.preheader ]
  %.025.us = phi i64 [ %22, %.preheader.us ], [ 0, %.preheader.us.preheader ]
  %19 = tail call i32 @bit_count(i64 %.07.us) #6
  %20 = sext i32 %19 to i64
  %21 = add nsw i64 %20, %.016.us
  %22 = add nuw nsw i64 %.025.us, 1
  %23 = add nuw nsw i64 %.07.us, 13
  %exitcond = icmp eq i64 %22, %15
  br i1 %exitcond, label %._crit_edge.us, label %.preheader.us

._crit_edge.us:                                   ; preds = %.preheader.us
  br i1 %12, label %.preheader.us.124.preheader, label %17

.preheader.us.124.preheader:                      ; preds = %17, %._crit_edge.us
  br label %.preheader.us.124

.preheader4.split:                                ; preds = %.preheader4
  br i1 %12, label %.us-lcssa.us, label %.preheader

.preheader:                                       ; preds = %.preheader4.split
  %24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0), i64 0)
  %25 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i64 0)
  %26 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i64 0)
  %27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i64 0)
  %28 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0), i64 0)
  %29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0), i64 0)
  %30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0), i64 0)
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %._crit_edge.us.6, %71, %.preheader4.split, %.preheader
  ret i32 0

.preheader.us.124:                                ; preds = %.preheader.us.124.preheader, %.preheader.us.124
  %.07.us.1 = phi i64 [ %35, %.preheader.us.124 ], [ 1, %.preheader.us.124.preheader ]
  %.016.us.1 = phi i64 [ %33, %.preheader.us.124 ], [ 0, %.preheader.us.124.preheader ]
  %.025.us.1 = phi i64 [ %34, %.preheader.us.124 ], [ 0, %.preheader.us.124.preheader ]
  %31 = tail call i32 @bitcount(i64 %.07.us.1) #6
  %32 = sext i32 %31 to i64
  %33 = add nsw i64 %32, %.016.us.1
  %34 = add nuw nsw i64 %.025.us.1, 1
  %35 = add nuw nsw i64 %.07.us.1, 13
  %exitcond.1 = icmp eq i64 %34, %15
  br i1 %exitcond.1, label %._crit_edge.us.1, label %.preheader.us.124

._crit_edge.us.1:                                 ; preds = %.preheader.us.124
  br i1 %12, label %.preheader.us.225.preheader, label %36

; <label>:36:                                     ; preds = %._crit_edge.us.1
  %37 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i64 %33)
  br label %.preheader.us.225.preheader

.preheader.us.225.preheader:                      ; preds = %36, %._crit_edge.us.1
  br label %.preheader.us.225

.preheader.us.225:                                ; preds = %.preheader.us.225.preheader, %.preheader.us.225
  %.07.us.2 = phi i64 [ %42, %.preheader.us.225 ], [ 1, %.preheader.us.225.preheader ]
  %.016.us.2 = phi i64 [ %40, %.preheader.us.225 ], [ 0, %.preheader.us.225.preheader ]
  %.025.us.2 = phi i64 [ %41, %.preheader.us.225 ], [ 0, %.preheader.us.225.preheader ]
  %38 = tail call i32 @ntbl_bitcnt(i64 %.07.us.2) #6
  %39 = sext i32 %38 to i64
  %40 = add nsw i64 %39, %.016.us.2
  %41 = add nuw nsw i64 %.025.us.2, 1
  %42 = add nuw nsw i64 %.07.us.2, 13
  %exitcond.2 = icmp eq i64 %41, %15
  br i1 %exitcond.2, label %._crit_edge.us.2, label %.preheader.us.225

._crit_edge.us.2:                                 ; preds = %.preheader.us.225
  br i1 %12, label %.preheader.us.326.preheader, label %43

; <label>:43:                                     ; preds = %._crit_edge.us.2
  %44 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i64 %40)
  br label %.preheader.us.326.preheader

.preheader.us.326.preheader:                      ; preds = %43, %._crit_edge.us.2
  br label %.preheader.us.326

.preheader.us.326:                                ; preds = %.preheader.us.326.preheader, %.preheader.us.326
  %.07.us.3 = phi i64 [ %49, %.preheader.us.326 ], [ 1, %.preheader.us.326.preheader ]
  %.016.us.3 = phi i64 [ %47, %.preheader.us.326 ], [ 0, %.preheader.us.326.preheader ]
  %.025.us.3 = phi i64 [ %48, %.preheader.us.326 ], [ 0, %.preheader.us.326.preheader ]
  %45 = tail call i32 @ntbl_bitcount(i64 %.07.us.3) #6
  %46 = sext i32 %45 to i64
  %47 = add nsw i64 %46, %.016.us.3
  %48 = add nuw nsw i64 %.025.us.3, 1
  %49 = add nuw nsw i64 %.07.us.3, 13
  %exitcond.3 = icmp eq i64 %48, %15
  br i1 %exitcond.3, label %._crit_edge.us.3, label %.preheader.us.326

._crit_edge.us.3:                                 ; preds = %.preheader.us.326
  br i1 %12, label %.preheader.us.427.preheader, label %50

; <label>:50:                                     ; preds = %._crit_edge.us.3
  %51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i64 %47)
  br label %.preheader.us.427.preheader

.preheader.us.427.preheader:                      ; preds = %50, %._crit_edge.us.3
  br label %.preheader.us.427

.preheader.us.427:                                ; preds = %.preheader.us.427.preheader, %.preheader.us.427
  %.07.us.4 = phi i64 [ %56, %.preheader.us.427 ], [ 1, %.preheader.us.427.preheader ]
  %.016.us.4 = phi i64 [ %54, %.preheader.us.427 ], [ 0, %.preheader.us.427.preheader ]
  %.025.us.4 = phi i64 [ %55, %.preheader.us.427 ], [ 0, %.preheader.us.427.preheader ]
  %52 = tail call i32 @BW_btbl_bitcount(i64 %.07.us.4) #6
  %53 = sext i32 %52 to i64
  %54 = add nsw i64 %53, %.016.us.4
  %55 = add nuw nsw i64 %.025.us.4, 1
  %56 = add nuw nsw i64 %.07.us.4, 13
  %exitcond.4 = icmp eq i64 %55, %15
  br i1 %exitcond.4, label %._crit_edge.us.4, label %.preheader.us.427

._crit_edge.us.4:                                 ; preds = %.preheader.us.427
  br i1 %12, label %.preheader.us.528.preheader, label %57

; <label>:57:                                     ; preds = %._crit_edge.us.4
  %58 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0), i64 %54)
  br label %.preheader.us.528.preheader

.preheader.us.528.preheader:                      ; preds = %57, %._crit_edge.us.4
  br label %.preheader.us.528

.preheader.us.528:                                ; preds = %.preheader.us.528.preheader, %.preheader.us.528
  %.07.us.5 = phi i64 [ %63, %.preheader.us.528 ], [ 1, %.preheader.us.528.preheader ]
  %.016.us.5 = phi i64 [ %61, %.preheader.us.528 ], [ 0, %.preheader.us.528.preheader ]
  %.025.us.5 = phi i64 [ %62, %.preheader.us.528 ], [ 0, %.preheader.us.528.preheader ]
  %59 = tail call i32 @AR_btbl_bitcount(i64 %.07.us.5) #6
  %60 = sext i32 %59 to i64
  %61 = add nsw i64 %60, %.016.us.5
  %62 = add nuw nsw i64 %.025.us.5, 1
  %63 = add nuw nsw i64 %.07.us.5, 13
  %exitcond.5 = icmp eq i64 %62, %15
  br i1 %exitcond.5, label %._crit_edge.us.5, label %.preheader.us.528

._crit_edge.us.5:                                 ; preds = %.preheader.us.528
  br i1 %12, label %.preheader.us.629.preheader, label %64

; <label>:64:                                     ; preds = %._crit_edge.us.5
  %65 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0), i64 %61)
  br label %.preheader.us.629.preheader

.preheader.us.629.preheader:                      ; preds = %64, %._crit_edge.us.5
  br label %.preheader.us.629

.preheader.us.629:                                ; preds = %.preheader.us.629.preheader, %.preheader.us.629
  %.07.us.6 = phi i64 [ %70, %.preheader.us.629 ], [ 1, %.preheader.us.629.preheader ]
  %.016.us.6 = phi i64 [ %68, %.preheader.us.629 ], [ 0, %.preheader.us.629.preheader ]
  %.025.us.6 = phi i64 [ %69, %.preheader.us.629 ], [ 0, %.preheader.us.629.preheader ]
  %66 = tail call i32 @bit_shifter(i64 %.07.us.6) #6
  %67 = sext i32 %66 to i64
  %68 = add nsw i64 %67, %.016.us.6
  %69 = add nuw nsw i64 %.025.us.6, 1
  %70 = add nuw nsw i64 %.07.us.6, 13
  %exitcond.6 = icmp eq i64 %69, %15
  br i1 %exitcond.6, label %._crit_edge.us.6, label %.preheader.us.629

._crit_edge.us.6:                                 ; preds = %.preheader.us.629
  br i1 %12, label %.us-lcssa.us, label %71

; <label>:71:                                     ; preds = %._crit_edge.us.6
  %72 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0), i64 %68)
  br label %.us-lcssa.us
}

declare i32 @bit_count(i64) #1

declare i32 @bitcount(i64) #1

declare i32 @ntbl_bitcnt(i64) #1

declare i32 @ntbl_bitcount(i64) #1

declare i32 @BW_btbl_bitcount(i64) #1

declare i32 @AR_btbl_bitcount(i64) #1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define internal i32 @bit_shifter(i64) #2 {
  %not.3 = icmp eq i64 %0, 0
  br i1 %not.3, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.06 = phi i64 [ %6, %.lr.ph ], [ %0, %.lr.ph.preheader ]
  %.015 = phi i32 [ %5, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %.024 = phi i32 [ %4, %.lr.ph ], [ 0, %.lr.ph.preheader ]
  %2 = trunc i64 %.06 to i32
  %3 = and i32 %2, 1
  %4 = add nsw i32 %3, %.024
  %5 = add nuw nsw i32 %.015, 1
  %6 = ashr i64 %.06, 1
  %7 = icmp ult i32 %5, 64
  %not. = icmp ne i64 %6, 0
  %. = and i1 %7, %not.
  br i1 %., label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %1
  %.02.lcssa = phi i32 [ 0, %1 ], [ %4, %._crit_edge.loopexit ]
  ret i32 %.02.lcssa
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
